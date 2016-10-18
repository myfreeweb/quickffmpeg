import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
	height: 720
	title: qsTr("quickffmpeg 0.0.0")


	InputPane {
		x: 0
		y: 0
		anchors.centerIn: parent
		anchors.fill: parent
		path: "D:/Footage/2016-08-20 22-52-47.mp4"
	}
}
