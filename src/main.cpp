// (c) 2017 Ekkehard Gentz (ekke) @ekkescorner
// my blog about Qt for mobile: http://j.mp/qt-x
// see also /COPYRIGHT and /LICENSE

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "QuickDownload/src/quickdownload.h"
#include "langswitch.h"

#include "applicationui.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    qputenv("QT_QUICK_CONTROLS_STYLE", "material");
    QGuiApplication app(argc, argv);

    ApplicationUI appui;

    QQmlApplicationEngine engine;

    // from QML we have access to ApplicationUI as myApp
    QQmlContext* context = engine.rootContext();
    context->setContextProperty("myApp", &appui);
    // some more context properties
    appui.addContextProperty(context);

#if defined(Q_OS_ANDROID)
    QObject::connect(&app, SIGNAL(applicationStateChanged(Qt::ApplicationState)), &appui, SLOT(onApplicationStateChanged(Qt::ApplicationState)));
#endif
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    qmlRegisterType<LangSwitch>("io.qt.examples.langswitch", 1, 0, "LangSwitch");
    return app.exec();
}
