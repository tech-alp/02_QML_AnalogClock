QT += quick

CONFIG += c++14

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        main.cpp \
        source/stopwatch.cpp

RESOURCES += \
    icon.qrc \
    qml.qrc \
    assets.qrc \
    components.qrc

DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    views/main.qml

HEADERS += \
    source/stopwatch.h
