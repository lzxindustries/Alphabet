cmake_minimum_required(VERSION 3.10)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/GetGitRevisionDescription.cmake)
git_describe(VERSION --tags --candidates=1)
message(STATUS ${VERSION})

#parse the version information into pieces.
string(REGEX REPLACE "^v([0-9]+)\\..*" "\\1" VERSION_MAJOR "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" VERSION_MINOR "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" VERSION_PATCH "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.[0-9]+(.*)" "\\1" VERSION_SHA1 "${VERSION}")
set(VERSION_SHORT "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
set(PROJECT_VERSION VERSION_SHORT)

get_filename_component(CURRENT_DIRECTORY ${CMAKE_SOURCE_DIR}/CMakeLists.txt DIRECTORY)
message(STATUS ${CURRENT_DIRECTORY})

string(REGEX REPLACE ".*/(.*)/" "" PROJECT_FOLDER_NAME "${CURRENT_DIRECTORY}")
message(STATUS ${PROJECT_FOLDER_NAME})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/src/version.cpp.in
                ${CMAKE_CURRENT_BINARY_DIR}/version.cpp)
set(version_file "${CMAKE_CURRENT_BINARY_DIR}/version.cpp")


