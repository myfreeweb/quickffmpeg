import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5
import FFVideoSource 0.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
	title: qsTr("quickffmpeg 0.0.0")

	FFVideoSource {
		id: videoProducer
		fileUrl: "file:D:/Footage/2016-08-20 22-52-47.mp4"
		ffmpegUrl: "file:C:/Users/greg/Downloads/ffmpeg-20160812-e8b355a-win64-static/bin/ffmpeg.exe"
		ffprobeUrl: "file:C:/Users/greg/Downloads/ffmpeg-20160812-e8b355a-win64-static/bin/ffprobe.exe"
	}

	RowLayout {
		x: 0
		y: 0
		anchors.centerIn: parent
		anchors.fill: parent

		VideoOutput {
			Layout.fillHeight: true
			Layout.fillWidth: true
			anchors.fill: parent
			source: videoProducer
		}
	}
}
