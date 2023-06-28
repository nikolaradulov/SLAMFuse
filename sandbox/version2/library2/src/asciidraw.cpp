#include "asciidraw.h"
#include <iostream>

namespace AsciiDraw{
    void draw(int N) {
        for (int i = 0; i < N; ++i) {
            std::cout << "       _.-'~~~~~~`-._\n"
                    << "      /      ||      \\\n"
                    << "     /       ||       \\\n"
                    << "    |        ||        |\n"
                    << "    | _______||_______ |\n"
                    << "    |/ ----- \\/ ----- \\|\n"
                    << "   /  (     )  (     )  \\\n"
                    << "  / \\  ----- () -----  / \\\n"
                    << " /   \\      /\\      /   \\\n"
                    << "/     \\    /  \\    /     \\\n"
                    << "       `-_\\  |_/-'\n"
                    << "           `--'\n";
            std::cout << std::endl;
        }
    }
}