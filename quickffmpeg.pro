QT += qml quick core multimedia widgets

CONFIG += c++11

SOURCES += main.cpp \
    ffvideosource.cpp \
    util.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    ffvideosource.h \
    util.h
