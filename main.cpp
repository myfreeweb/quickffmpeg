#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ffvideosource.h"

int main(int argc, char *argv[]) {
	FFVideoSource::registerQmlType();

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
