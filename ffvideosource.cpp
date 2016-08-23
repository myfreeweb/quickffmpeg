#include "ffvideosource.h"
#include <QtQml/qqml.h>
#include <QDebug>

void FFVideoSource::registerQmlType() {
	// @uri FFVideoSource
	qmlRegisterType<FFVideoSource>("FFVideoSource", 0, 1, "FFVideoSource");
}

FFVideoSource::FFVideoSource(QObject *parent) : QObject(parent), _surface(0) {
	startTimer(1000 / 60);
}

FFVideoSource::~FFVideoSource() {
	stop();
	closeSurface();
}

QAbstractVideoSurface* FFVideoSource::videoSurface() const {
	return _surface;
}

void FFVideoSource::setVideoSurface(QAbstractVideoSurface* s) {
	closeSurface();
	_surface = s;
	_surface->start(QVideoSurfaceFormat(_size, QVideoFrame::Format_YUV420P));
}

void FFVideoSource::closeSurface() {
	if (_surface && _surface->isActive())
		_surface->stop();
}

QUrl FFVideoSource::fileUrl() const {
	return _fileUrl;
}

void FFVideoSource::setFileUrl(QUrl u) {
	_fileUrl = u;
	restart();
}

QUrl FFVideoSource::ffmpegUrl() const {
	return _ffmpegUrl;
}

void FFVideoSource::setFfmpegUrl(QUrl u) {
	_ffmpegUrl = u;
	restart();
}

QUrl FFVideoSource::ffprobeUrl() const {
	return _ffprobeUrl;
}

void FFVideoSource::setFfprobeUrl(QUrl u) {
	_ffprobeUrl = u;
	restart();
}

void FFVideoSource::start() {
	stop();
	if (_fileUrl.toString() == "") return;
	if (_ffprobeUrl.toString() == "") return;
	if (_ffmpegUrl.toString() == "") return;

	QProcess probeProcess;
	probeProcess.start(_ffprobeUrl.toLocalFile(),
					   QStringList() << "-v" << "quiet" << "-print_format" << "json" << "-show_streams" << _fileUrl.toLocalFile());
	probeProcess.waitForFinished();
	auto doc = QJsonDocument::fromJson(probeProcess.readAllStandardOutput()).object();
	auto streams = doc["streams"].toArray();
	for (auto stream_v : streams) {
		auto stream = stream_v.toObject();
		if (stream["codec_type"].toString() == "video") {
			_size.setHeight(stream["height"].toInt());
			_size.setWidth(stream["width"].toInt());
		}
	}

	if (_surface)
		_surface->start(QVideoSurfaceFormat(_size, QVideoFrame::Format_YUV420P));

	_process.start(_ffmpegUrl.toLocalFile(),
				   QStringList() << "-i" << _fileUrl.toLocalFile() << "-hide_banner" << "-loglevel" << "panic" << "-pix_fmt" << "yuv420p" << "-f" << "rawvideo" << "-vcodec" << "rawvideo" << "-");
	_started = true;
}

void FFVideoSource::restart() {
	if (_started)
		start();
}

void FFVideoSource::stop() {
	if (_process.isOpen())
		_process.kill();
	_started = false;
}

void FFVideoSource::timerEvent(QTimerEvent*) {
	if (!_surface || !_started || !_process.isOpen()) return;
	const size_t frSize = _size.width()*_size.height()*1.5;
	QVideoFrame frame(frSize, _size, _size.width(), QVideoFrame::Format_YUV420P);
	frame.map(QAbstractVideoBuffer::WriteOnly);
	uchar *pixels = frame.bits();
	_process.read((char*)pixels, frSize);
	frame.unmap();
	_surface->present(frame);
}
