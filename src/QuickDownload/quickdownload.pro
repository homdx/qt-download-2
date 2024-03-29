TEMPLATE = lib
TARGET = QuickDownload
QT += qml quick network
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.blackgrain.qml.quickdownload

//QMAKE_LINK += '-nostdlib++'

#if defined(Q_OS_ANDROID)
QMAKE_LINK += '-nostdlib++'
#elif defined(Q_OS_LINUX)
QMAKE_LINK += ''
#elif defined(Q_OS_WIN)
QMAKE_LINK += ''
#else
QMAKE_LINK += ''
#endif


HEADERS += \
    src/quickdownload_plugin.h \
    src/quickdownload.h

SOURCES += \
    src/quickdownload_plugin.cpp \
    src/quickdownload.cpp

DISTFILES = qmldir \
    quickdownload.pri \
    $$PWD/README.md \
    $$PWD/LICENSE

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}
