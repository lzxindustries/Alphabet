cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)

set(COMPANY_NAME "LZX Industries")

project(Alphabet VERSION 0.1.0)

set(PROJECT_SOURCE_FILES     
    src/console.cpp
    src/main.cpp
    src/mainwindow.cpp
    src/settingsdialog.cpp
    src/application.qrc
    src/mainwindow.ui
    src/settingsdialog.ui
)

include_directories(cmake/include)
include_directories(src)
include_directories(include)

include(cmake/modules/BuildSetup.cmake)
