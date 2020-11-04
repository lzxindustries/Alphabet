cmake_minimum_required(VERSION 3.0.0)

project(Alphabet VERSION 0.1.0)

# Qt Required
set(CMAKE_PREFIX_PATH "C:/Qt/5.14.2/msvc2017_64") 
set(CPACK_IFW_ROOT "C:/Qt/Tools/QtInstallerFramework/4.0")
set(CMAKE_MODULE_PATH "cmake/modules")
set(Qt5_DIR "C:/Qt/5.14.2/msvc2017_64/lib/cmake/Qt5")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(Alphabet WIN32 MACOSX_BUNDLE 
    src/console.cpp
    src/main.cpp
    src/mainwindow.cpp
    src/settingsdialog.cpp
    src/alphabet.qrc
    src/mainwindow.ui
    src/settingsdialog.ui
)

install(
    TARGETS Alphabet
    RUNTIME DESTINATION Alphabet
    COMPONENT AlphabetInstaller
    BUNDLE DESTINATION Alphabet
    COMPONENT AlphabetInstaller
)

function(CPACKIFW_COMMON)
    set(CPACK_PACKAGE_NAME Alphabet)
    set(CPACK_PACKAGE_FILE_NAME Installer)
    set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Alphabet Installer")
    set(CPACK_PACKAGE_VERSION "1.0.0") # Version of installer
    set(CPACK_COMPONENTS_ALL AlphabetInstaller)
    set(CPACK_IFW_PACKAGE_START_MENU_DIRECTORY Alphabet)
    set(CPACK_GENERATOR IFW)
    set(CPACK_IFW_VERBOSE ON)

    include(CPack REQUIRED)
    include(CPackIFW REQUIRED)

    cpack_add_component(
        AlphabetInstaller
        DISPLAY_NAME "Alphabet"
        DESCRIPTION "Install Alphabet"
        REQUIRED
    )

    cpack_ifw_configure_component(
        AlphabetInstaller
        FORCED_INSTALLATION
        NAME qt.cpackifw.installer
        VERSION ${PROJECT_VERSION} # Version of component
        LICENSES License ${Alphabet_SOURCE_DIR}/LICENSE
        DEFAULT TRUE
    )
endfunction()

if(CPACK_IFW_ROOT OR DEFINED ENV{QTIFWDIR})
    if(DEFINED {CMAKE_PREFIX_PATH})
        if(APPLE)
            if(EXISTS ${CMAKE_PREFIX_PATH}/bin/macdeployqt)
                message("*")
                message("* Note")
                message("*")
                message("* Because of a bug in CPackIFW, it doesn't manage correctly the package created on OSX.")
                message("* Unfortunately CPackIFW doesn't forward the .dmg extension to the binarycreator (see IFW documentation for more details).")
                message("* Therefore it creates a .app directory on OSX, that isn't properly a file and cannot be treated the same way .run and .exe files are.")
                message("* As a result, make package generates an empty directory within the build directory and leaves the bundle somewhere within the _CPack_Packages directory.")
                message("*")
                message("* I strongly suggest to run binarycreator through an external script and use the .dmg extension directly. At least until the bug in CPackIFW isn't fixed.")
                message("* From within the build directory run:")
                message("*")
                message("*     binarycreator -f -c _CPack_Packages/Darwin/IFW/installer/config/config.xml -p _CPack_Packages/Darwin/IFW/installer/packages/ package/installer.dmg")
                message("*")
                message("* The bundle and the dmg file will be created within the package directory as:")
                message("*")
                message("*     package/installer.app [bundle]")
                message("*     package/installer.dmg [dmg]")
                message("*")

                add_custom_command(
                    TARGET Alphabet POST_BUILD
                    COMMAND ${CMAKE_PREFIX_PATH}/bin/macdeployqt ${PROJECT_NAME}.app
                )

                CPACKIFW_COMMON()
            else()
                message("Unable to find executable QTDIR/bin/macdeployqt.")
            endif()
        elseif(WIN32)
            if(EXISTS ${CMAKE_PREFIX_PATH}/bin/windeployqt.exe)
                add_custom_command(
                    TARGET Alphabet POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/windeployqt_stuff
                    COMMAND ${CMAKE_PREFIX_PATH}/bin/windeployqt.exe --compiler-runtime --dir ${CMAKE_BINARY_DIR}/windeployqt_stuff $<TARGET_FILE:if(CPACK_IFW_ROOT OR DEFINED ENV{QTIFWDIR})
    if(DEFINED {CMAKE_PREFIX_PATH})
        if(APPLE)
            if(EXISTS ${CMAKE_PREFIX_PATH}/bin/macdeployqt)
                message("*")
                message("* Note")
                message("*")
                message("* Because of a bug in CPackIFW, it doesn't manage correctly the package created on OSX.")
                message("* Unfortunately CPackIFW doesn't forward the .dmg extension to the binarycreator (see IFW documentation for more details).")
                message("* Therefore it creates a .app directory on OSX, that isn't properly a file and cannot be treated the same way .run and .exe files are.")
                message("* As a result, make package generates an empty directory within the build directory and leaves the bundle somewhere within the _CPack_Packages directory.")
                message("*")
                message("* I strongly suggest to run binarycreator through an external script and use the .dmg extension directly. At least until the bug in CPackIFW isn't fixed.")
                message("* From within the build directory run:")
                message("*")
                message("*     binarycreator -f -c _CPack_Packages/Darwin/IFW/installer/config/config.xml -p _CPack_Packages/Darwin/IFW/installer/packages/ package/installer.dmg")
                message("*")
                message("* The bundle and the dmg file will be created within the package directory as:")
                message("*")
                message("*     package/installer.app [bundle]")
                message("*     package/installer.dmg [dmg]")
                message("*")

                add_custom_command(
                    TARGET Alphabet POST_BUILD
                    COMMAND ${CMAKE_PREFIX_PATH}/bin/macdeployqt ${PROJECT_NAME}.app
                )

                CPACKIFW_COMMON()
            else()
                message("Unable to find executable QTDIR/bin/macdeployqt.")
            endif()
        elseif(WIN32)
            if(EXISTS ${CMAKE_PREFIX_PATH}/bin/windeployqt.exe)
                add_custom_command(
                    TARGET Alphabet POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/windeployqt_stuff
                    COMMAND ${CMAKE_PREFIX_PATH}/bin/windeployqt.exe --compiler-runtime --dir ${CMAKE_BINARY_DIR}/windeployqt_stuff $<TARGET_FILE:Alphabet>
                )

                install(
                    DIRECTORY ${CMAKE_BINARY_DIR}/windeployqt_stuff/
                    DESTINATION ${PROJECT_NAME}
                    COMPONENT AlphabetInstaller
                )

                CPACKIFW_COMMON()
            else()
                message("Unable to find executable QTDIR/bin/windeployqt.")
            endif()
        elseif(UNIX)
            CPACKIFW_COMMON()
        endif()
    else()
        message("Set properly environment variable QTDIR to be able to create a package.")
    endif()
else()
    message("If you want to enable target package you can:")
    message("\t* Either pass -DCPACK_IFW_ROOT=<path> to cmake")
    message("\t* Or set the environment variable QTIFWDIR")
    message("To specify the location of the QtIFW tool suite.")
    message("The specified path should not contain bin at the end (for example: D:\\DevTools\\QtIFW2.0.5).")
endif()
                )

                install(
                    DIRECTORY ${CMAKE_BINARY_DIR}/windeployqt_stuff/
                    DESTINATION ${PROJECT_NAME}
                    COMPONENT AlphabetInstaller
                )

                CPACKIFW_COMMON()
            else()
                message("Unable to find executable QTDIR/bin/windeployqt.")
            endif()
        elseif(UNIX)
            CPACKIFW_COMMON()
        endif()
    else()
        message("Set properly environment variable QTDIR to be able to create a package.")
    endif()
else()
    message("If you want to enable target package you can:")
    message("\t* Either pass -DCPACK_IFW_ROOT=<path> to cmake")
    message("\t* Or set the environment variable QTIFWDIR")
    message("To specify the location of the QtIFW tool suite.")
    message("The specified path should not contain bin at the end (for example: D:\\DevTools\\QtIFW2.0.5).")
endif()

find_package(Qt5 COMPONENTS Widgets SerialPort Core Gui REQUIRED)
target_link_libraries(Alphabet Qt5::Widgets Qt5::Core Qt5::Gui Qt5::SerialPort)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

