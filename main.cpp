#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "source/stopwatch.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    Stopwatch stopwatch;
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("stopwatch",&stopwatch);
    engine.addImportPath("qrc:/");
    const QUrl url(QStringLiteral("qrc:/views/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
