#include "util.h"
#include <QtQml/qqml.h>

void Util::registerQmlType() {
	// @uri Util
	qmlRegisterType<Util>("Util", 0, 1, "Util");
}

Util::Util(QObject *parent) {}

QString Util::path(const QString s) const {
	return QFileInfo(s).path();
}

QString Util::basename(const QString s) const {
	return QFileInfo(s).completeBaseName();
}

QString Util::lastbasename(const QString s) const {
	return QFileInfo(s).baseName();
}

QString Util::filename(const QString s) const {
	return QFileInfo(s).fileName();
}

QString Util::dirname(const QString s) const {
	return QFileInfo(s).dir().path();
}

QString Util::ext(const QString s) const {
	return QFileInfo(s).completeSuffix();
}

QString Util::lastext(const QString s) const {
	return QFileInfo(s).suffix();
}
