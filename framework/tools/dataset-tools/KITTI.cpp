/*

 Copyright (c) 2023 University of Edinburgh, Imperial College, University of Manchester.
 Developed in the PAMELA project, EPSRC Programme Grant EP/K008730/1

 This code is licensed under the MIT License.

*/

#include "include/KITTI.h"
#include "include/utils/RegexPattern.h"
#include "include/utils/dataset_utils.h"
#include "io/sensor/sensor_builder.h"
#include <io/SLAMFile.h>
#include <io/SLAMFrame.h>
#include <io/sensor/IMUSensor.h>
#include <io/sensor/LidarSensor.h>
#include <io/sensor/GroundTruthSensor.h>
#include <io/format/PointCloud.h>
#include <Eigen/Eigen>
#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/highgui/highgui.hpp>

#include <boost/filesystem.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/regex.hpp>
#include <boost/algorithm/string.hpp> 

#include <iostream>
#include <iomanip>
#include <sstream>
#include <fstream>
#include "TimeStamp.h"


using namespace slambench::io;

std::list<slambench::TimeStamp> loadLeftGreyTimeStamps(const std::string &dirname) {

    std::string line;
    std::ifstream infile(dirname + "/image_00/timestamps.txt");
    std::list<slambench::TimeStamp> timestamps;

    boost::smatch match;
    boost::regex comment = boost::regex(RegexPattern::comment);
    // format of timestamp: yyyy-mm-dd hr:min:sec.nsec 2011-09-30 12:40:59.442522880
    // extract hr, min, sec, nsec
    boost::regex pattern("^\\d{4}-\\d{2}-\\d{2} (\\d{2}):(\\d{2}):(\\d{2})\\.(\\d{9})$");

    while (std::getline(infile, line)) {
        if (line.empty() || boost::regex_match(line, match, comment)) {
            continue;
        } else if (boost::regex_match(line, match, pattern)) {

            int hour = std::stoi(match[1]);
            int min = std::stoi(match[2]);
            int second = std::stoi(match[3]);
            int timestampS = hour * 3600 + min * 60 + second;
            int timestampNS = std::stoi(match[4]) * std::pow(10, 9 - match[4].length());

            slambench::TimeStamp ts;
            ts.S = timestampS;
            ts.Ns = timestampNS;
            timestamps.push_back(ts);

        } else {
            std::cerr << "Unknown line in timestamps.txt of left RGB camera:" << line << std::endl;
            timestamps.clear();
            return timestamps;
        }
    }
    return timestamps;
}

bool resizeImage(const std::string &filename, int width, int height) {

    cv::Mat originalImage = cv::imread(filename);

    if (originalImage.empty()) {
        std::cout << "Could not read the image: " << filename << std::endl;
        return false;
    }

    cv::Mat resizedImage;
    cv::resize(originalImage, resizedImage, cv::Size(width, height));

    if (!cv::imwrite(filename, resizedImage)) {
        std::cout << "Could not save the resized image." << std::endl;
        return false;
    }

    return true;
}

bool loadKITTIRGBData(const std::string &dirname,
                      const std::string &camera_idx,
                      SLAMFile &file,
                      const Sensor::pose_t &pose,
                      const CameraSensor::intrinsics_t &intrinsics,
                      const CameraSensor::distortion_type_t &distortion_type,
                      const CameraSensor::distortion_coefficients_t &distortion,
                      const bool rect) {
    
    auto img_params = KITTIReader::get_image_params(rect);
    auto rgb_sensor = RGBSensorBuilder()
            .rate(img_params.rate)
            .size(img_params.width, img_params.height)
            .pose(pose)
            .intrinsics(intrinsics)
            .distortion(distortion_type, distortion)
            .index(file.Sensors.size())
            .build();
    
    file.Sensors.AddSensor(rgb_sensor);

    std::string line;
    std::ifstream infile(dirname + "/" + camera_idx + "/timestamps.txt");

    boost::smatch match;
    boost::regex comment = boost::regex(RegexPattern::comment);
    // format of timestamp: yyyy-mm-dd hr:min:sec.nsec 2011-09-30 12:40:59.442522880
    // extract hr, min, sec, nsec
    boost::regex pattern("^\\d{4}-\\d{2}-\\d{2} (\\d{2}):(\\d{2}):(\\d{2})\\.(\\d{9})$");

    int img_index = 0;
    while (std::getline(infile, line)) {
        if (line.empty()) {
            continue;
        } else if (boost::regex_match(line, match, comment)) {
            continue;
        } else if (boost::regex_match(line, match, pattern)) {

            int hour = std::stoi(match[1]);
            int min = std::stoi(match[2]);
            int second = std::stoi(match[3]);
            int timestampS = hour * 3600 + min * 60 + second;
            int timestampNS = std::stoi(match[4]) * std::pow(10, 9 - match[4].length());

            auto rgb_frame = new ImageFileFrame();
            rgb_frame->FrameSensor = rgb_sensor;
            rgb_frame->Timestamp.S = timestampS;
            rgb_frame->Timestamp.Ns = timestampNS;

            // start from 0000000000.png
            std::stringstream tmp_filename;
            tmp_filename << std::setw(10) << std::setfill('0') << img_index;
            std::string rgb_filename = tmp_filename.str() + ".png";
            img_index++;

            std::stringstream frame_name;
            frame_name << dirname << "/" << camera_idx << "/data/" << rgb_filename;
            // rectified image should be resize to dimensions that is multiple of 16
            if (rect) {
                if (!resizeImage(frame_name.str(), img_params.width, img_params.height)){
                    return false;
                }
            }
            rgb_frame->filename = frame_name.str();

            if (access(rgb_frame->filename.c_str(), F_OK) < 0) {
                printf("No RGB image for frame (%s)\n", frame_name.str().c_str());
                perror("");
                return false;
            }

            file.AddFrame(rgb_frame);

        } else {
            std::cerr << "Unknown line:" << line << std::endl;
            return false;
        }
    }
    return true;
}

bool loadKITTIGreyData(const std::string &dirname,
                      const std::string &camera_idx,
                      SLAMFile &file,
                      const Sensor::pose_t &pose,
                      const CameraSensor::intrinsics_t &intrinsics,
                      const CameraSensor::distortion_type_t &distortion_type,
                      const CameraSensor::distortion_coefficients_t &distortion,
                      const bool rect) {
    
    auto img_params = KITTIReader::get_image_params(rect);
    auto grey_sensor = GreySensorBuilder()
            .rate(img_params.rate)
            .size(img_params.width, img_params.height)
            .pose(pose)
            .intrinsics(intrinsics)
            .distortion(distortion_type, distortion)
            .index(file.Sensors.size())
            .build();
    
    file.Sensors.AddSensor(grey_sensor);

    std::string line;
    std::ifstream infile(dirname + "/" + camera_idx + "/timestamps.txt");
    // std::ifstream infile(dirname + "/image_00/timestamps.txt");

    boost::smatch match;
    boost::regex comment = boost::regex(RegexPattern::comment);
    // format of timestamp: yyyy-mm-dd hr:min:sec.nsec 2011-09-30 12:40:59.442522880
    // extract hr, min, sec, nsec
    boost::regex pattern("^\\d{4}-\\d{2}-\\d{2} (\\d{2}):(\\d{2}):(\\d{2})\\.(\\d{9})$");

    int img_index = 0;
    while (std::getline(infile, line)) {
        if (line.empty()) {
            continue;
        } else if (boost::regex_match(line, match, comment)) {
            continue;
        } else if (boost::regex_match(line, match, pattern)) {

            int hour = std::stoi(match[1]);
            int min = std::stoi(match[2]);
            int second = std::stoi(match[3]);
            int timestampS = hour * 3600 + min * 60 + second;
            int timestampNS = std::stoi(match[4]) * std::pow(10, 9 - match[4].length());

            auto grey_frame = new ImageFileFrame();
            grey_frame->FrameSensor = grey_sensor;
            grey_frame->Timestamp.S = timestampS;
            grey_frame->Timestamp.Ns = timestampNS;

            // start from 0000000000.png
            std::stringstream tmp_filename;
            tmp_filename << std::setw(10) << std::setfill('0') << img_index;
            std::string grey_filename = tmp_filename.str() + ".png";
            img_index++;

            std::stringstream frame_name;
            frame_name << dirname << "/" << camera_idx << "/data/" << grey_filename;
            if (rect) {
                if (!resizeImage(frame_name.str(), img_params.width, img_params.height)){
                    return false;
                }
            }
            grey_frame->filename = frame_name.str();

            if (access(grey_frame->filename.c_str(), F_OK) < 0) {
                printf("No Grey image for frame (%s)\n", frame_name.str().c_str());
                perror("");
                return false;
            }

            file.AddFrame(grey_frame);

        } else {
            std::cerr << "Unknown line:" << line << std::endl;
            return false;
        }
    }
    return true;
}

bool loadKITTIIMUData() {
    
}

bool loadKITTIGroundTruthData(const std::string &dirname, SLAMFile &file) {
    
    auto gt_sensor = GTSensorBuilder()
                .index(file.Sensors.size())
                .build();

    file.Sensors.AddSensor(gt_sensor);

    /***
     * No    Sequence Name       start   end
     * 00: 2011_10_03_drive_0027 000000 004540
     * 01: 2011_10_03_drive_0042 000000 001100
     * 02: 2011_10_03_drive_0034 000000 004660
     * 03: 2011_09_26_drive_0067 000000 000800
     * 04: 2011_09_30_drive_0016 000000 000270
     * 05: 2011_09_30_drive_0018 000000 002760
     * 06: 2011_09_30_drive_0020 000000 001100
     * 07: 2011_09_30_drive_0027 000000 001100
     * 08: 2011_09_30_drive_0028 001100 005170
     * 09: 2011_09_30_drive_0033 000000 001590
     * 10: 2011_09_30_drive_0034 000000 001200
    */
    std::ifstream infile;
    int start, end;
    // do not support 26 and 30 yet
    if (dirname.find("2011_09_30_drive_0016") != std::string::npos) {
        // pose 04
        std::cerr << "Use pose 04 for 2011_09_30_drive_0016" << std::endl;
        infile.open(dirname+"/poses/04.txt");
        start = 0; end = 270;

    } else if (dirname.find("2011_09_30_drive_0018") != std::string::npos) {
        // pose 05
        std::cerr << "Use pose 05 for 2011_09_30_drive_0018" << std::endl;
        infile.open(dirname+"/poses/05.txt");
        start = 0; end = 2760;

    } else if (dirname.find("2011_09_30_drive_0020") != std::string::npos) {
        // pose 06
        std::cerr << "Use pose 06 for 2011_09_30_drive_0020" << std::endl;
        infile.open(dirname+"/poses/06.txt");
        start = 0; end = 1100;

    } else if (dirname.find("2011_09_30_drive_0027") != std::string::npos) {
        // pose 07
        std::cerr << "Use pose 07 for 2011_09_30_drive_0027" << std::endl;
        infile.open(dirname+"/poses/07.txt");
        start = 0; end = 1100;

    } else if (dirname.find("2011_09_30_drive_0028") != std::string::npos) {
        // pose 08
        std::cerr << "Use pose 08 for 2011_09_30_drive_0028" << std::endl;
        infile.open(dirname+"/poses/08.txt");
        start = 1100; end = 5170;

    } else if (dirname.find("2011_09_30_drive_0033") != std::string::npos) {
        // pose 09
        std::cerr << "Use pose 09 for 2011_09_30_drive_0033" << std::endl;
        infile.open(dirname+"/poses/09.txt");
        start = 0; end = 1590;

    } else if (dirname.find("2011_09_30_drive_0034") != std::string::npos) {
        // pose 10
        std::cerr << "Use pose 10 for 2011_09_30_drive_0034" << std::endl;
        infile.open(dirname+"/poses/10.txt");
        start = 0; end = 1200;

    } else {
        std::cerr << "Invalid path to KITTI dataset groundtruth" << std::endl;
    }

    if (!infile.is_open()) {
        std::cerr << "Fail to open the pose file" << std::endl;
    }

    std::list<slambench::TimeStamp> timestamps = loadLeftGreyTimeStamps(dirname);
    if (timestamps.size() == 0) {
        std::cerr << "Unable to load timestamps of left RGB camera" << std::endl;
        return false;
    }

    std::string line;
    boost::smatch match;
    boost::regex comment = boost::regex(RegexPattern::comment);
    // pattern for 1.000000e+00
    boost::regex pattern("^[+-]?[0-9]+(\\.[0-9]+)?(?:e|E)[+-]?[0-9]+$");
    
    while (std::getline(infile, line)) {
        if (line.empty() || boost::regex_match(line, match, comment)) {
            continue;
        }

        std::vector<std::string> pose_values;
        std::vector<float> pose_elems;
        boost::split(pose_values, line, boost::is_any_of(" "));
        /***
         * pose value: r11 r12 r13 tx r21 r22 r23 ty r31 r32 r33 tz
         * r11 r12 r13 tx
         * r21 r22 r23 ty
         * r31 r32 r33 tz
         * 0   0   0   1
         */
        
        for (const std::string& val : pose_values) {
            if (!boost::regex_match(val, pattern)) {
                std::cerr << val << " is NOT in the valid scientific notation format." << std::endl;
                return false;
            }
            float number = boost::lexical_cast<float>(val);
            pose_elems.push_back(number);
        }
        
        Eigen::Matrix4f pose;
        pose << pose_elems.at(0), pose_elems.at(1), pose_elems.at(2), pose_elems.at(3),
                pose_elems.at(4), pose_elems.at(5), pose_elems.at(6), pose_elems.at(7),
                pose_elems.at(8), pose_elems.at(9), pose_elems.at(10), pose_elems.at(11),
                0.0f,             0.0f,             0.0f,             1.0f;
        
        slambench::TimeStamp ts = timestamps.front();
        timestamps.pop_front();

        auto gt_frame = new SLAMInMemoryFrame();
        gt_frame->FrameSensor = gt_sensor;
        gt_frame->Timestamp.S = ts.S;
        gt_frame->Timestamp.Ns = ts.Ns;
        gt_frame->Data = malloc(gt_frame->GetSize());

        memcpy(gt_frame->Data, pose.data(), gt_frame->GetSize());

        file.AddFrame(gt_frame);
    }
    return true;
}

SLAMFile* KITTIReader::GenerateSLAMFile() {
    if(!(grey || rgb || lidar || gt)) {
        std::cerr <<  "No sensors defined\n";
        return nullptr;
    }
    std::string dirname = input;
    std::vector<std::string> requirements = {};

    if (grey) {
        requirements.emplace_back("image_00/data");
        requirements.emplace_back("image_00/timestamps.txt");
    }

    if (rgb) {
        requirements.emplace_back("image_02/data");
        requirements.emplace_back("image_02/timestamps.txt");
    }

    if (lidar) {
        requirements.emplace_back("velodyne_points/data");
        requirements.emplace_back("velodyne_points/timestamps.txt");
        requirements.emplace_back("velodyne_points/timestamps_end.txt");
        requirements.emplace_back("velodyne_points/timestamps_start.txt");
    }

    if (imu) {
        requirements.emplace_back("oxts/data");
        requirements.emplace_back("oxts/dataformat.txt");
        requirements.emplace_back("oxts/timestamps.txt");
    }

    if (!checkRequirements(dirname, requirements)) {
        std::cerr << "Invalid folder." << std::endl;
        return nullptr;
    }

    auto slamfilep = new SLAMFile();
    SLAMFile &slamfile = *slamfilep;

    CameraSensor::intrinsics_t cam_intrinsics_lgrey;
    CameraSensor::intrinsics_t cam_intrinsics_rgrey;
    CameraSensor::intrinsics_t cam_intrinsics_lrgb;
    CameraSensor::intrinsics_t cam_intrinsics_rrgb;

    CameraSensor::distortion_type_t cam_distortion_type;
    CameraSensor::distortion_coefficients_t cam_distortion_lgrey;
    CameraSensor::distortion_coefficients_t cam_distortion_rgrey;
    CameraSensor::distortion_coefficients_t cam_distortion_lrgb;
    CameraSensor::distortion_coefficients_t cam_distortion_rrgb;

    Sensor::pose_t pose_lgrey = Eigen::Matrix4f::Identity();
    Sensor::pose_t pose_rgrey = Eigen::Matrix4f::Identity();
    Sensor::pose_t pose_lrgb = Eigen::Matrix4f::Identity();
    Sensor::pose_t pose_rrgb = Eigen::Matrix4f::Identity();
    bool rect = true;

    KITTIReader::DatasetOrigin d_origin = check_data_origin();
    
    // Check the raw data type
    if (d_origin == KITTIReader::DatasetOrigin::RD11_09_30) {

        std::cout << "using unrectified parameter from 2011-09-30" << std::endl;
        get_params(cam_intrinsics_lgrey, cam_intrinsics_rgrey, cam_intrinsics_lrgb, cam_intrinsics_rrgb,
                    cam_distortion_type, cam_distortion_lgrey, cam_distortion_rgrey, cam_distortion_lrgb, cam_distortion_rrgb);
        pose_rgrey << 9.993424e-01,  1.830363e-02, -3.129928e-02, -5.370000e-01,  
                     -1.856768e-02,  9.997943e-01, -8.166432e-03,  5.591661e-03,
                      3.114337e-02,  8.742218e-03,  9.994767e-01, -1.200541e-02,
                      0.000000e+00,  0.000000e+00,  0.000000e+00,  1.000000e+00;
        pose_rgrey = pose_rgrey.inverse().eval();

        pose_lrgb <<  9.999805e-01, -4.971067e-03, -3.793081e-03,  6.030222e-02,
                      4.954076e-03,  9.999777e-01, -4.475856e-03, -1.293125e-03,
                      3.815246e-03,  4.456977e-03,  9.999828e-01,  5.900421e-03,
                      0.000000e+00,  0.000000e+00,  0.000000e+00,  1.000000e+00;
        pose_lrgb = pose_lrgb.inverse().eval();

        pose_rrgb <<  9.994995e-01,  1.667420e-02, -2.688514e-02, -4.747879e-01,
                     -1.673122e-02,  9.998582e-01, -1.897204e-03,  5.631988e-03,
                      2.684969e-02,  2.346075e-03,  9.996367e-01, -5.233709e-03,
                      0.000000e+00,  0.000000e+00,  0.000000e+00,  1.000000e+00;
        pose_rrgb = pose_rrgb.inverse().eval();

        rect = false;

    } else if (d_origin == KITTIReader::DatasetOrigin::RD11_09_30_RECT) {

        std::cout << "using rectified parameter from 2011-09-30" << std::endl;
        get_params(cam_intrinsics_lgrey, cam_intrinsics_rgrey, cam_intrinsics_lrgb, cam_intrinsics_rrgb,
                    cam_distortion_type, cam_distortion_lgrey, cam_distortion_rgrey, cam_distortion_lrgb, cam_distortion_rrgb);
        pose_rgrey(0, 3) = -5.370000e-01; 
        pose_rgrey = pose_rgrey.inverse().eval();
        pose_lrgb(0, 3) = 5.956621e-02;
        pose_rrgb(0, 3) = -4.731050e-01;

        rect = true;

    } else {

        std::cout << "Invalid Path, please check d_origin at KITTI.cpp" << std::endl;
        return nullptr;

    }
    
    // Load Left Grey Camera
    std::string left_grey = "image_00";
    if (grey && !loadKITTIGreyData(dirname, left_grey, slamfile, pose_lgrey, 
                                   cam_intrinsics_lgrey, cam_distortion_type, cam_distortion_lgrey, rect)) {
        std::cout << "Error while loading left Grey information." << std::endl;
        delete slamfilep;
        return nullptr;
    }

    // Load Right Grey Camera
    std::string right_grey = "image_01";
    if (grey && stereo && !loadKITTIGreyData(dirname, right_grey, slamfile, pose_rgrey, 
                                   cam_intrinsics_rgrey, cam_distortion_type, cam_distortion_rgrey, rect)) {
        std::cout << "Error while loading right Grey information." << std::endl;
        delete slamfilep;
        return nullptr;
    }

    // Load Left RGB Camera
    std::string left_rgb = "image_02";
    if (rgb && !loadKITTIRGBData(dirname, left_rgb, slamfile, pose_lrgb, 
                                 cam_intrinsics_lrgb, cam_distortion_type, cam_distortion_lrgb, rect)) {
        std::cout << "Error while loading left RGB information." << std::endl;
        delete slamfilep;
        return nullptr;
    }

    // Load Right RGB Camera
    std::string right_rgb = "image_03";
    if (rgb && stereo && !loadKITTIRGBData(dirname, right_rgb, slamfile, pose_rrgb, 
                                 cam_intrinsics_rrgb, cam_distortion_type, cam_distortion_rrgb, rect)) {
        std::cout << "Error while loading left RGB information." << std::endl;
        delete slamfilep;
        return nullptr;
    }

    if (gt && !loadKITTIGroundTruthData(dirname, slamfile)) {
        std::cout << "Error while loading GroundTruth information." << std::endl;
        delete slamfilep;
        return nullptr;
    }
    
    return slamfilep;

}