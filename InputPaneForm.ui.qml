import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

ColumnLayout {
	id: outerColumn
	anchors.fill: parent
	default property alias contents: flickable.data
	property alias outputPanesHeight: flickable.contentHeight
	property alias browseButton: browseButton
	property alias browseInput: browseInput
	clip: false

	RowLayout {
		id: filePickRow
		height: 40
		spacing: 10
		Layout.fillWidth: true
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0

		TextInput {
			id: browseInput
			width: 80
			height: 20
			text: qsTr("Text Input")
			font.family: "Courier"
			Layout.fillWidth: true
			font.pixelSize: 12
		}

		Button {
			id: browseButton
			text: qsTr("Browse...")
		}

	}

	Flickable {
		id: flickable
		width: 480
		height: 640
		flickableDirection: Flickable.VerticalFlick
		clip: true
		Layout.fillHeight: true
		Layout.fillWidth: true
	}

	GridLayout {
		id: addOutputRow
		height: 40
		Layout.fillHeight: false
		Layout.fillWidth: true
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0
	}



}
