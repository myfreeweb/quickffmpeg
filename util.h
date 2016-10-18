#pragma once

#include <QObject>
#include <QFileInfo>
#include <QDir>

class Util : public QObject {
	Q_OBJECT
public:
	static void registerQmlType();

	explicit Util(QObject *parent = 0);

	Q_INVOKABLE QString path(const QString s) const;
	Q_INVOKABLE QString basename(const QString s) const;
	Q_INVOKABLE QString lastbasename(const QString s) const;
	Q_INVOKABLE QString filename(const QString s) const;
	Q_INVOKABLE QString dirname(const QString s) const;
	Q_INVOKABLE QString ext(const QString s) const;
	Q_INVOKABLE QString lastext(const QString s) const;

};
