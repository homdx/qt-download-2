#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "QuickDownload/src/quickdownload.h"
#include "langswitch.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    qmlRegisterType<LangSwitch>("io.qt.examples.langswitch", 1, 0, "LangSwitch");
//    qmlRegisterType<QuickDownload>("com.blackgrain.qml.quickdownload", 1, 0, "Download");
    return app.exec();
}
