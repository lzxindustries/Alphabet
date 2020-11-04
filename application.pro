QT += widgets serialport
requires(qtConfig(combobox))

TARGET = Alphabet
TEMPLATE = app

SOURCES += \
    src/main.cpp \
    src/mainwindow.cpp \
    src/settingsdialog.cpp \
    src/console.cpp

HEADERS += \
    src/mainwindow.h \
    src/settingsdialog.h \
    src/console.h

FORMS += \
    src/mainwindow.ui \
    src/settingsdialog.ui

RESOURCES += \
    src/application.qrc \

target.path = C:/repo/alphabet
INSTALLS += target
