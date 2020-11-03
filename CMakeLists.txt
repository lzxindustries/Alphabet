cmake_minimum_required (VERSION 3.10)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")
include_directories(include)
include_directories(cmake/include)

include(GetGitRevisionDescription)

git_describe(VERSION --tags --dirty=-dirty --abbrev=0 )
message(WARNING "${VERSION}")
string(REGEX REPLACE "^v([0-9]+)\\..*" "\\1" VERSION_MAJOR "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" VERSION_MINOR "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" VERSION_PATCH "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.[0-9]+(.*)" "\\1" VERSION_SHA1 "${VERSION}")
set(VERSION_SHORT "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
message(WARNING "${VERSION_SHORT}")


configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/version.cpp.in
                ${CMAKE_CURRENT_BINARY_DIR}/version.cpp)
set(version_file "${CMAKE_CURRENT_BINARY_DIR}/version.cpp")
set(source_files "${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp")

cmake_policy(SET CMP0042 NEW)


project(AppTemplate 
        VERSION "${VERSION_SHORT}"
        DESCRIPTION "LZX Industries Application"
        LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

## Default Qt5 path
if(WIN32)
  set(Qt5_DIR "C:/Users/circleci/project/5.14.2/msvc2017_64/lib/cmake/Qt5" CACHE PATH "directory where Qt5Config.cmake exists.")
elseif(APPLE)
  set(Qt5_DIR "/usr/local/Cellar/qt/5.14.2/clang_64/lib/cmake/Qt5/" CACHE PATH "directory where Qt5Config.cmake exists.")
else()
  set(Qt5_DIR "" CACHE PATH "directory where Qt5Config.cmake exists.")
endif()
find_package(Qt5 COMPONENTS Core Widgets REQUIRED)

##---------------------------------------------------------------------------------
if(WIN32)
  set(CMAKE_WIN32_EXECUTABLE ON)
elseif(APPLE)
  set(CMAKE_MACOSX_BUNDLE ON)
endif()
set(target ${PROJECT_NAME})
# add_executable(${target} src/main.cpp)
add_executable(${PROJECT_NAME} ${source_files} ${version_file})
target_link_libraries(${target} PRIVATE Qt5::Core Qt5::Widgets)

## Qt5 configurations
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set_target_properties(${target} PROPERTIES AUTORCC_OPTIONS "--compress;9")

if(UNIX AND NOT APPLE)
    install(TARGETS ${target} RUNTIME DESTINATION bin)
elseif(WIN32)
    install(TARGETS ${target} RUNTIME DESTINATION bin)
elseif(APPLE)
    set(CMAKE_MACOSX_BUNDLE ON)
    set(CMAKE_MACOSX_RPATH ON)
    install(TARGETS ${target} BUNDLE DESTINATION .
                              RUNTIME DESTINATION .)
    set_source_files_properties(resources/icon.icns PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
    set_target_properties(${target}
                          PROPERTIES
                          MACOSX_BUNDLE_BUNDLE_NAME "${PROJECT_NAME}"
                          MACOSX_BUNDLE_INFO_STRING "${PROJECT_NAME} Copyright (c) 2020 LZX Industries LLC"
                          MACOSX_BUNDLE_ICON_FILE Icon.icns
                          MACOSX_BUNDLE_GUI_IDENTIFIER "${PROJECT_NAME}"
                          MACOSX_BUNDLE_LONG_VERSION_STRING "${PROJECT_VERSION}"
                          MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}"
                          MACOSX_BUNDLE_BUNDLE_VERSION "${PROJECT_VERSION}"
                          MACOSX_BUNDLE_COPYRIGHT "Copyright (c) 2020 LZX Industries LLC"
                          )
endif()

set(desktop.path applications)
set(desktop.files resources/example.desktop)
set(icon.path icons/hicolor/64x64/apps)
set(icon.files resources/icon64.png)
set(iconsvg.path icons/hicolor/scalable/apps)
set(iconsvg.files resources/icon.svg)
foreach(items IN ITEMS desktop icon iconsvg)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/${${items}.files}
            DESTINATION share/${${items}.path}
            PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ)
endforeach()
# Components:
if(CMAKE_BUILD_TYPE_UPPER MATCHES "^(DEBUG|RELWITHDEBINFO)$")
    set(CPACK_STRIP_FILES FALSE)
else()
    set(CPACK_STRIP_FILES TRUE)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmake/modules/Packaging.cmake)

##---------------------------------------------------------------------------------

option(CMake_RUN_CLANG_TIDY "Run clang-tidy with the compiler." OFF)
if(CMake_RUN_CLANG_TIDY)
  if(CMake_SOURCE_DIR STREQUAL CMake_BINARY_DIR)
    message(FATAL_ERROR "CMake_RUN_CLANG_TIDY requires an out-of-source build!")
  endif()
  find_program(CLANG_TIDY_COMMAND NAMES clang-tidy)
  if(NOT CLANG_TIDY_COMMAND)
    message(WARNING "CMake_RUN_CLANG_TIDY is ON but clang-tidy is not found!")
    set(CMAKE_CXX_CLANG_TIDY "" CACHE STRING "" FORCE)
  else()
    set(CLANG_TIDY_CHECKS "-*,modernize-*")
    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND};-checks=${CLANG_TIDY_CHECKS};-header-filter='${CMAKE_SOURCE_DIR}/src/*'")
  endif()

  # Create a preprocessor definition that depends on .clang-tidy content so
  # the compile command will change when .clang-tidy changes.  This ensures
  # that a subsequent build re-runs clang-tidy on all sources even if they
  # do not otherwise need to be recompiled.  Nothing actually uses this
  # definition.  We add it to targets on which we run clang-tidy just to
  # get the build dependency on the .clang-tidy file.
  file(SHA1 ${CMAKE_CURRENT_SOURCE_DIR}/.clang-tidy clang_tidy_sha1)
  set(CLANG_TIDY_DEFINITIONS "CLANG_TIDY_SHA1=${clang_tidy_sha1}")
  unset(clang_tidy_sha1)

endif()

option(CMake_RUN_IWYU "Run include-what-you-use with the compiler." OFF)
if(CMake_RUN_IWYU)
  find_program(IWYU_COMMAND NAMES include-what-you-use iwyu)
  if(NOT IWYU_COMMAND)
    message(WARNING "CMake_RUN_IWYU is ON but include-what-you-use is not found!")
  else()
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE
      "${IWYU_COMMAND};-Xiwyu;--mapping_file=${CMake_SOURCE_DIR}/Utilities/IWYU/mapping.imp;-w")
    list(APPEND CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${CMake_IWYU_OPTIONS})
  endif()
endif()

# Clazy is a Qt oriented code checker based on clang framework. Krazy's little brother.
set(CMake_RUN_CLAZY OFF CACHE BOOL "Add clazy check for builds")
if(ENABLE_CLAZY)
  find_program(CLAZY_EXECUTABLE NAMES clazy PATHS /usr/local/llvm/bin /usr/local/bin /opt/clazy/bin)
  if(CLAZY_EXECUTABLE)
    message(STATUS "clazy found: ${CLAZY_EXECUTABLE}")
  else()
    message(AUTHOR_WARNING "clazy not found.")
  endif()
endif()

# vim: ts=2 sw=2 sts=2 et
