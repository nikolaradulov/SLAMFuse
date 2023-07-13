#!/bin/bash

case "$1" in
    --test)
        make g2o
        make opencv
        make suiteparse
        make lsdslam
        make slambench APPS=lsdslam
        make datasets/ICL_NUIM/living_room_traj2_loop.slam
        ./build/bin/slambench -i datasets/ICL_NUIM/living_room_traj2_loop.slam -load ./build/lib/liblsdslam-cpp-library.so
        ;;
    --dataset)
        if [ -z "$2" ]; then
            echo "Missing dataset name."
            exit 1
        fi
        # file = "/slambench/datasets/datasets.repos" 
        # touch "$file" 
        # repos="RGF0YXNldDpUVU0KdHVtLXRlc3Rpbmc7VGVzdGluZyBhbmQgRGVidWdnaW5nO2ZyZWlidXJnMS9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcxX3h5ei5zbGFtO2ZyZWlidXJnMS9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcxX3JweS5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX3h5ei5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX3JweS5zbGFtCnR1bS1oYW5kaGVsZDtIYW5kaGVsZCBTTEFNO2ZyZWlidXJnMS9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcxXzM2MC5zbGFtO2ZyZWlidXJnMS9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcxX2Zsb29yLnNsYW07ZnJlaWJ1cmcxL3JnYmRfZGF0YXNldF9mcmVpYnVyZzFfZGVzay5zbGFtO2ZyZWlidXJnMS9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcxX2Rlc2syLnNsYW07ZnJlaWJ1cmcxL3JnYmRfZGF0YXNldF9mcmVpYnVyZzFfcm9vbS5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyXzM2MF9oZW1pc3BoZXJlLnNsYW07ZnJlaWJ1cmcyL3JnYmRfZGF0YXNldF9mcmVpYnVyZzJfMzYwX2tpZG5hcC5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX2Rlc2suc2xhbTtmcmVpYnVyZzIvcmdiZF9kYXRhc2V0X2ZyZWlidXJnMl9kZXNrX3dpdGhfcGVyc29uLnNsYW07ZnJlaWJ1cmcyL3JnYmRfZGF0YXNldF9mcmVpYnVyZzJfbGFyZ2Vfbm9fbG9vcC5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX2xhcmdlX3dpdGhfbG9vcC5zbGFtCnR1bS1yb2JvdDtSb2JvdCBTTEFNO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX3Bpb25lZXJfMzYwLnNsYW07ZnJlaWJ1cmcyL3JnYmRfZGF0YXNldF9mcmVpYnVyZzJfcGlvbmVlcl9zbGFtLnNsYW07ZnJlaWJ1cmcyL3JnYmRfZGF0YXNldF9mcmVpYnVyZzJfcGlvbmVlcl9zbGFtMi5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX3Bpb25lZXJfc2xhbTMuc2xhbQp0dW0tc3RydWN0O1N0cnVjdHVyZSB2cyBUZXh0dXJlO2ZyZWlidXJnMy9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmczX25vc3RydWN0dXJlX25vdGV4dHVyZV9mYXIuc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM19ub3N0cnVjdHVyZV9ub3RleHR1cmVfbmVhcl93aXRobG9vcC5zbGFtO2ZyZWlidXJnMy9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmczX25vc3RydWN0dXJlX3RleHR1cmVfZmFyLnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfbm9zdHJ1Y3R1cmVfdGV4dHVyZV9uZWFyX3dpdGhsb29wLnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfc3RydWN0dXJlX25vdGV4dHVyZV9mYXIuc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM19zdHJ1Y3R1cmVfbm90ZXh0dXJlX25lYXIuc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM19zdHJ1Y3R1cmVfdGV4dHVyZV9mYXIuc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM19zdHJ1Y3R1cmVfdGV4dHVyZV9uZWFyLnNsYW0KdHVtLWR5bmFtaWM7RHluYW1pYyBPYmplY3RzO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX2Rlc2tfd2l0aF9wZXJzb24uc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM19zaXR0aW5nX3N0YXRpYy5zbGFtO2ZyZWlidXJnMy9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmczX3NpdHRpbmdfeHl6LnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfc2l0dGluZ19oYWxmc3BoZXJlLnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfc2l0dGluZ19ycHkuc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM193YWxraW5nX3N0YXRpYy5zbGFtO2ZyZWlidXJnMy9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmczX3dhbGtpbmdfeHl6LnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfd2Fsa2luZ19oYWxmc3BoZXJlLnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfd2Fsa2luZ19ycHkuc2xhbQp0dW0tb2JqZWN0czszRCBPYmplY3QgUmVjb25zdHJ1Y3Rpb247ZnJlaWJ1cmcxL3JnYmRfZGF0YXNldF9mcmVpYnVyZzFfcGxhbnQuc2xhbTtmcmVpYnVyZzEvcmdiZF9kYXRhc2V0X2ZyZWlidXJnMV90ZWRkeS5zbGFtO2ZyZWlidXJnMi9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmcyX2Nva2Uuc2xhbTtmcmVpYnVyZzIvcmdiZF9kYXRhc2V0X2ZyZWlidXJnMl9kaXNoZXMuc2xhbTtmcmVpYnVyZzIvcmdiZF9kYXRhc2V0X2ZyZWlidXJnMl9mbG93ZXJib3VxdWV0LnNsYW07ZnJlaWJ1cmcyL3JnYmRfZGF0YXNldF9mcmVpYnVyZzJfZmxvd2VyYm91cXVldF9icm93bmJhY2tncm91bmQuc2xhbTtmcmVpYnVyZzIvcmdiZF9kYXRhc2V0X2ZyZWlidXJnMl9tZXRhbGxpY19zcGhlcmUuc2xhbTtmcmVpYnVyZzIvcmdiZF9kYXRhc2V0X2ZyZWlidXJnMl9tZXRhbGxpY19zcGhlcmUyLnNsYW07ZnJlaWJ1cmczL3JnYmRfZGF0YXNldF9mcmVpYnVyZzNfY2FiaW5ldC5zbGFtO2ZyZWlidXJnMy9yZ2JkX2RhdGFzZXRfZnJlaWJ1cmczX2xhcmdlX2NhYmluZXQuc2xhbTtmcmVpYnVyZzMvcmdiZF9kYXRhc2V0X2ZyZWlidXJnM190ZWRkeS5zbGFtCgpEYXRhc2V0OklDTF9OVUlNCmljbC1udWltO0xpdmluZyBSb29tO2xpdmluZ19yb29tX3RyYWowX2xvb3Auc2xhbTtsaXZpbmdfcm9vbV90cmFqMV9sb29wLnNsYW07bGl2aW5nX3Jvb21fdHJhajJfbG9vcC5zbGFtO2xpdmluZ19yb29tX3RyYWozX2xvb3Auc2xhbQoKRGF0YXNldDpFVEhJCmV0aGk7SWxsdW1pbmF0aW9uIERhdGFzZXQ7ZXRobF9yZWFsX2ZsYXNoLnNsYW07ZXRobF9yZWFsX2xvY2FsLnNsYW07ZXRobF9yZWFsX2dsb2JhbC5zbGFtO2V0aGxfc3luMS5zbGFtO2V0aGxfc3luMV9sb2NhbC5zbGFtO2V0aGxfc3luMV9nbG9iYWwuc2xhbTtldGhsX3N5bjFfbG9jX2dsby5zbGFtO2V0aGxfc3luMV9mbGFzaC5zbGFtO2V0aGxfc3luMi5zbGFtO2V0aGxfc3luMl9sb2NhbC5zbGFtO2V0aGxfc3luMl9nbG9iYWwuc2xhbTtldGhsX3N5bjJfbG9jX2dsby5zbGFtO2V0aGxfc3luMl9mbGFzaC5zbGFtCgpEYXRhc2V0OkV1Um9DTUFWCmV1cm9jbWF2LW1oO01hY2hpbmUgSGFsbDttYWNoaW5lX2hhbGwvTUhfMDFfZWFzeS9NSF8wMV9lYXN5LnNsYW07bWFjaGluZV9oYWxsL01IXzAyX2Vhc3kvTUhfMDJfZWFzeS5zbGFtO21hY2hpbmVfaGFsbC9NSF8wM19tZWRpdW0vTUhfMDNfbWVkaXVtLnNsYW07bWFjaGluZV9oYWxsL01IXzA0X2RpZmZpY3VsdC9NSF8wNF9kaWZmaWN1bHQuc2xhbTttYWNoaW5lX2hhbGwvTUhfMDVfZGlmZmljdWx0L01IXzA1X2RpZmZpY3VsdC5zbGFtCmV1cm9jbWF2LXZpY29uO1ZpY29uIFJvb207dmljb25fcm9vbTEvVjFfMDFfZWFzeS9WMV8wMV9lYXN5LnNsYW07dmljb25fcm9vbTEvVjFfMDJfbWVkaXVtL1YxXzAyX21lZGl1bS5zbGFtO3ZpY29uX3Jvb20xL1YxXzAzX2RpZmZpY3VsdC9WMV8wM19kaWZmaWN1bHQuc2xhbTt2aWNvbl9yb29tMi9WMl8wMV9lYXN5L1YyXzAxX2Vhc3kuc2xhbTt2aWNvbl9yb29tMi9WMl8wMl9tZWRpdW0vVjJfMDJfbWVkaXVtLnNsYW07dmljb25fcm9vbTIvVjJfMDNfZGlmZmljdWx0L1YyXzAzX2RpZmZpY3VsdC5zbGFtCgpEYXRhc2V0OkJPTk4KYm9ubi1iYWxsb29uO0JhbGxvb247cmdiZF9ib25uX2JhbGxvb24uc2xhbTtyZ2JkX2Jvbm5fYmFsbG9vbjIuc2xhbTtyZ2JkX2Jvbm5fYmFsbG9vbl90cmFja2luZy5zbGFtO3JnYmRfYm9ubl9iYWxsb29uX3RyYWNraW5nMi5zbGFtCmJvbm4tcGVvcGxlO1Blb3BsZTtyZ2JkX2Jvbm5fY3Jvd2Quc2xhbTtyZ2JkX2Jvbm5fY3Jvd2QyLnNsYW07cmdiZF9ib25uX2Nyb3dkMy5zbGFtO3JnYmRfYm9ubl9wZXJzb25fdHJhY2tpbmcuc2xhbTtyZ2JkX2Jvbm5fcGVyc29uX3RyYWNraW5nMi5zbGFtCmJvbm4tYm94ZXM7Qm94ZXM7cmdiZF9ib25uX2tpZG5hcHBpbmdfYm94LnNsYW07cmdiZF9ib25uX2tpZG5hcHBpbmdfYm94Mi5zbGFtO3JnYmRfYm9ubl9tb3Zpbmdfbm9ub2JzdHJ1Y3RpbmdfYm94LnNsYW07cmdiZF9ib25uX21vdmluZ19ub25vYnN0cnVjdGluZ19ib3gyLnNsYW07cmdiZF9ib25uX21vdmluZ19vYnN0cnVjdGluZ19ib3guc2xhbTtyZ2JkX2Jvbm5fbW92aW5nX29ic3RydWN0aW5nX2JveDIuc2xhbTtyZ2JkX2Jvbm5fcGxhY2luZ19ub25vYnN0cnVjdGluZ19ib3guc2xhbTtyZ2JkX2Jvbm5fcGxhY2luZ19ub25vYnN0cnVjdGluZ19ib3gyLnNsYW07cmdiZF9ib25uX3BsYWNpbmdfbm9ub2JzdHJ1Y3RpbmdfYm94My5zbGFtO3JnYmRfYm9ubl9wbGFjaW5nX29ic3RydWN0aW5nX2JveC5zbGFtO3JnYmRfYm9ubl9yZW1vdmluZ19ub25vYnN0cnVjdGluZ19ib3guc2xhbTtyZ2JkX2Jvbm5fcmVtb3Zpbmdfbm9ub2JzdHJ1Y3RpbmdfYm94Mi5zbGFtO3JnYmRfYm9ubl9yZW1vdmluZ19vYnN0cnVjdGluZ19ib3guc2xhbQpib25uLXN5bmM7U3luY2hyb25vdXMgYW5kIFN0YXRpYztyZ2JkX2Jvbm5fc3luY2hyb25vdXMuc2xhbTtyZ2JkX2Jvbm5fc3luY2hyb25vdXMyLnNsYW07cmdiZF9ib25uX3N0YXRpYy5zbGFtO3JnYmRfYm9ubl9zdGF0aWNfY2xvc2VfZmFyLnNsYW0KCkRhdGFzZXQ6VVpIRlBWCnV6aGZwdi1mb3J3YXJkLXNuYXA7SW5kb29yIGZvcndhcmQgZmFjaW5nIFNuYXBkcmFnb247aW5kb29yX2ZvcndhcmRfM19zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtpbmRvb3JfZm9yd2FyZF81X3NuYXBkcmFnb25fd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzZfc25hcGRyYWdvbl93aXRoX2d0LnNsYW07aW5kb29yX2ZvcndhcmRfN19zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtpbmRvb3JfZm9yd2FyZF84X3NuYXBkcmFnb24uc2xhbTtpbmRvb3JfZm9yd2FyZF85X3NuYXBkcmFnb25fd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzEwX3NuYXBkcmFnb25fd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzExX3NuYXBkcmFnb24uc2xhbTtpbmRvb3JfZm9yd2FyZF8xMl9zbmFwZHJhZ29uLnNsYW0KdXpoZnB2LWZvcndhcmQtZGF2aXM7SW5kb29yIGZvcndhcmQgZmFjaW5nIERhdmlzO2luZG9vcl9mb3J3YXJkXzNfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzVfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzZfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzdfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl9mb3J3YXJkXzhfZGF2aXMuc2xhbTtpbmRvb3JfZm9yd2FyZF85X2RhdmlzX3dpdGhfZ3Quc2xhbTtpbmRvb3JfZm9yd2FyZF8xMF9kYXZpc193aXRoX2d0LnNsYW07aW5kb29yX2ZvcndhcmRfMTFfZGF2aXMuc2xhbTtpbmRvb3JfZm9yd2FyZF8xMl9kYXZpcy5zbGFtCnV6aGZwdi00NS1kb3dud2FyZC1zbmFwO0luZG9vciA0NSBkZWdyZWUgZG93bndhcmQgZmFjaW5nIFNuYXBkcmFnb247aW5kb29yXzQ1XzFfc25hcGRyYWdvbi5zbGFtO2luZG9vcl80NV8yX3NuYXBkcmFnb25fd2l0aF9ndC5zbGFtO2luZG9vcl80NV8zX3NuYXBkcmFnb24uc2xhbTtpbmRvb3JfNDVfNF9zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtpbmRvb3JfNDVfOV9zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtpbmRvb3JfNDVfMTFfc25hcGRyYWdvbi5zbGFtO2luZG9vcl80NV8xMl9zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtpbmRvb3JfNDVfMTNfc25hcGRyYWdvbl93aXRoX2d0LnNsYW07aW5kb29yXzQ1XzE0X3NuYXBkcmFnb25fd2l0aF9ndC5zbGFtO2luZG9vcl80NV8xNl9zbmFwZHJhZ29uLnNsYW0KdXpoZnB2LTQ1LWRvd253YXJkLWRhdmlzO0luZG9vciA0NSBkZWdyZWUgZG93bndhcmQgZmFjaW5nIERhdmlzO2luZG9vcl80NV8xX2RhdmlzLnNsYW07aW5kb29yXzQ1XzJfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl80NV8zX2RhdmlzLnNsYW07aW5kb29yXzQ1XzRfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl80NV85X2RhdmlzX3dpdGhfZ3Quc2xhbTtpbmRvb3JfNDVfMTFfZGF2aXMuc2xhbTtpbmRvb3JfNDVfMTJfZGF2aXNfd2l0aF9ndC5zbGFtO2luZG9vcl80NV8xM19kYXZpc193aXRoX2d0LnNsYW07aW5kb29yXzQ1XzE0X2RhdmlzX3dpdGhfZ3Quc2xhbTtpbmRvb3JfNDVfMTZfZGF2aXMuc2xhbQp1emhmcHYtb3V0ZG9vci1mb3J3YXJkLXNuYXA7T3V0ZG9vciBmb3J3YXJkIGZhY2luZyBTbmFwZHJhZ29uO291dGRvb3JfZm9yd2FyZF8xX3NuYXBkcmFnb25fd2l0aF9ndC5zbGFtO291dGRvb3JfZm9yd2FyZF8yX3NuYXBkcmFnb24uc2xhbTtvdXRkb29yX2ZvcndhcmRfM19zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtvdXRkb29yX2ZvcndhcmRfNV9zbmFwZHJhZ29uX3dpdGhfZ3Quc2xhbTtvdXRkb29yX2ZvcndhcmRfNl9zbmFwZHJhZ29uLnNsYW07b3V0ZG9vcl9mb3J3YXJkXzlfc25hcGRyYWdvbi5zbGFtO291dGRvb3JfZm9yd2FyZF8xMF9zbmFwZHJhZ29uLnNsYW0KdXpoZnB2LW91dGRvb3ItZm9yd2FyZC1zbmFwO091dGRvb3IgZm9yd2FyZCBmYWNpbmcgRGF2aXM7b3V0ZG9vcl9mb3J3YXJkXzFfZGF2aXNfd2l0aF9ndC5zbGFtO291dGRvb3JfZm9yd2FyZF8yX2RhdmlzLnNsYW07b3V0ZG9vcl9mb3J3YXJkXzNfZGF2aXNfd2l0aF9ndC5zbGFtO291dGRvb3JfZm9yd2FyZF81X2RhdmlzX3dpdGhfZ3Quc2xhbTtvdXRkb29yX2ZvcndhcmRfNl9kYXZpcy5zbGFtO291dGRvb3JfZm9yd2FyZF85X2RhdmlzLnNsYW07b3V0ZG9vcl9mb3J3YXJkXzEwX2RhdmlzLnNsYW0KdXpoZnB2LW91dGRvb3ItNDUtZG93bndhcmQtc25hcDtPdXRkb29yIDQ1IGRlZ3JlZSBkb3dud2FyZCBmYWNpbmcgU25hcGRyYWdvbjtvdXRkb29yXzQ1XzFfc25hcGRyYWdvbl93aXRoX2d0LnNsYW07b3V0ZG9vcl80NV8yX3NuYXBkcmFnb24uc2xhbQp1emhmcHYtb3V0ZG9vci00NS1kb3dud2FyZC1kYXZpcztPdXRkb29yIDQ1IGRlZ3JlZSBkb3dud2FyZCBmYWNpbmcgRGF2aXM7b3V0ZG9vcl80NV8xX2RhdmlzX3dpdGhfZ3Quc2xhbTtvdXRkb29yXzQ1XzJfZGF2aXMuc2xhbQoKRGF0YXNldDpTVk8Kc3ZvO0FydGlmaWNpYWwgRGF0YXNldDthcnRpZmljaWFsLnNsYW0KCkRhdGFzZXQ6T3BlbkxPUklTCm9wZW5sb3Jpcy1jYWZlO0NhZmU7Y2FmZTEvY2FmZTEtMS5zbGFtO2NhZmUxL2NhZmUxLTIuc2xhbQpvcGVubG9yaXMtY29ycmlkb3I7Q29ycmlkb3I7Y29ycmlkb3IxL2NvcnJpZG9yMS0xLnNsYW07Y29ycmlkb3IxL2NvcnJpZG9yMS0yLnNsYW07Y29ycmlkb3IxL2NvcnJpZG9yMS0zLnNsYW07Y29ycmlkb3IxL2NvcnJpZG9yMS00LnNsYW07Y29ycmlkb3IxL2NvcnJpZG9yMS01LnNsYW0Kb3BlbmxvcmlzLWhvbWU7SG9tZTtob21lMS9ob21lMS0xLnNsYW07aG9tZTEvaG9tZTEtMi5zbGFtO2hvbWUxL2hvbWUxLTMuc2xhbTtob21lMS9ob21lMS00LnNsYW07aG9tZTEvaG9tZTEtNS5zbGFtCm9wZW5sb3Jpcy1tYXJrZXQ7TWFya2V0O21hcmtldDEvbWFya2V0MS0xLnNsYW07bWFya2V0MS9tYXJrZXQxLTIuc2xhbTttYXJrZXQxL21hcmtldDEtMy5zbGFtCm9wZW5sb3Jpcy1vZmZpY2U7T2ZmaWNlO29mZmljZTEvb2ZmaWNlMS0xLnNsYW07b2ZmaWNlMS9vZmZpY2UxLTIuc2xhbTtvZmZpY2UxL29mZmljZTEtMy5zbGFtO29mZmljZTEvb2ZmaWNlMS00LnNsYW07b2ZmaWNlMS9vZmZpY2UxLTUuc2xhbTtvZmZpY2UxL29mZmljZTEtNi5zbGFtO29mZmljZTEvb2ZmaWNlMS03LnNsYW0KCkRhdGFzZXQ6Vm9sdW1lRGVmb3JtCnZvbHVtZWRlZm9ybTtWb2x1bWVEZWZvcm07YWR2ZW50Y2FsZW5kZXIuc2xhbTtib3hpbmcuc2xhbTtob29kaWUuc2xhbTttaW5pb24uc2xhbTtzaGlydC5zbGFtO3N1bmZsb3dlci5zbGFtO3VtYnJlbGxhLnNsYW07dXBwZXJib2R5LnNsYW0K"
        # echo "$repos" | base64 -d > "$file"
        make "$2"
        ;;
    --build)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Missing data path or algorithm path."
            exit 1
        fi
        ./build/bin/slambench -i "$2" -load "$3"
        ;;
    *)
        echo "Invalid argument. Usage: $0 [--test | --dataset <dataset_name> | --build <data_path> <algorithm_path>]"
        exit 1
        ;;
esac
