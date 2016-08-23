#pragma once

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonArray>
#include <QProcess>
#include <QUrl>
#include <QtMultimedia/QVideoSurfaceFormat>
#include <QtMultimedia/QAbstractVideoSurface>

class FFVideoSource : public QObject {
	Q_OBJECT
	Q_PROPERTY(QAbstractVideoSurface* videoSurface READ videoSurface WRITE setVideoSurface)
	Q_PROPERTY(QUrl fileUrl READ fileUrl WRITE setFileUrl)
	Q_PROPERTY(QUrl ffmpegUrl READ ffmpegUrl WRITE setFfmpegUrl)
	Q_PROPERTY(QUrl ffprobeUrl READ ffprobeUrl WRITE setFfprobeUrl)

public:
	static void registerQmlType();

	explicit FFVideoSource(QObject *parent = 0);
	~FFVideoSource();

	QAbstractVideoSurface* videoSurface() const;
	void setVideoSurface(QAbstractVideoSurface* s);

	QUrl fileUrl() const;
	void setFileUrl(QUrl u);

	QUrl ffmpegUrl() const;
	void setFfmpegUrl(QUrl u);

	QUrl ffprobeUrl() const;
	void setFfprobeUrl(QUrl u);

	Q_INVOKABLE void start();
	Q_INVOKABLE void restart();
	Q_INVOKABLE void stop();

protected:
	void timerEvent(QTimerEvent*);

private:
	bool _started = false;
	void closeSurface();
	QAbstractVideoSurface* _surface;
	QUrl _fileUrl;
	QUrl _ffmpegUrl;
	QUrl _ffprobeUrl;
	QSize _size;
	QProcess _process;

signals:

public slots:
};
