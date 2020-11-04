QT += widgets serialport
requires(qtConfig(combobox))

TARGET = Alphabet
TEMPLATE = app

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    settingsdialog.cpp \
    console.cpp

HEADERS += \
    mainwindow.h \
    settingsdialog.h \
    console.h

FORMS += \
    mainwindow.ui \
    settingsdialog.ui

RESOURCES += \
    alphabet.qrc \

target.path = C:/repo/alphabet
INSTALLS += target
