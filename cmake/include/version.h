#pragma once

#include <stdint.h>
#include <string>

namespace lzx { 
    struct VersionInfo {
        uint32_t major;
        uint32_t minor;
        uint32_t patch;
        uint32_t tweak;
        std::string name;
        std::string gitVersion;
        std::string gitVersionShort;
    };

    extern const VersionInfo kVersionInfo;
};