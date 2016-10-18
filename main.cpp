#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ffvideosource.h"
#include "util.h"
#include <stdlib.h>

int main(int argc, char *argv[]) {
	FFVideoSource::registerQmlType();
	Util::registerQmlType();

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
