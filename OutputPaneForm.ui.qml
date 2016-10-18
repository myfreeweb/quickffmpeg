import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ColumnLayout {
	id: outerColumn
	anchors.bottomMargin: 6
	anchors.topMargin: 6
	anchors.rightMargin: 6
	anchors.leftMargin: 6
	anchors.fill: parent
	spacing: 12

	default property alias contents: previewRow.data

	property alias videoFormats: videoFormatSel.model
	property alias audioFormats: audioFormatSel.model
	property alias containerFormats: containerSel.model

	property alias videoFormat: videoFormatSel.currentText
	property alias audioFormat: audioFormatSel.currentText
	property alias containerFormat: containerSel.currentText

	property alias videoQualityMin: videoQualitySlider.from
	property alias videoQualityMax: videoQualitySlider.to
	property alias videoQualityStep: videoQualitySlider.stepSize
	property alias videoQuality: videoQualitySlider.value

	property alias audioQualityMin: audioQualitySlider.from
	property alias audioQualityMax: audioQualitySlider.to
	property alias audioQualityStep: audioQualitySlider.stepSize
	property alias audioQuality: audioQualitySlider.value

	property alias patienceMin: patienceSlider.from
	property alias patienceMax: patienceSlider.to
	property alias patienceStep: patienceSlider.stepSize
	property alias patience: patienceSlider.value

	property alias optionsGenerated: optionsGeneratedText.text
	property alias optionsCustom: optionsCustomText.text

	property alias saveToScript: saveToScriptText.text
	property alias saveToResult: saveToResultText.text

	RowLayout {
		id: convToRow
		Layout.fillWidth: true
		spacing: 10
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0

		Label {
			id: convTo
			text: qsTr("Convert to")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		ComboBox {
			id: videoFormatSel
			width: 80
			height: 26
			Layout.fillWidth: true
			rightPadding: 3
			leftPadding: 12
			bottomPadding: 3
			topPadding: 3
			anchors.verticalCenter: parent.verticalCenter
		}

		Label {
			id: and
			text: qsTr("&")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		ComboBox {
			id: audioFormatSel
			width: 80
			height: 26
			Layout.fillWidth: true
			rightPadding: 3
			leftPadding: 12
			bottomPadding: 3
			topPadding: 3
			anchors.verticalCenter: parent.verticalCenter
		}

		Label {
			id: cont
			text: qsTr("in")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		ComboBox {
			id: containerSel
			width: 80
			height: 26
			Layout.fillWidth: true
			rightPadding: 3
			leftPadding: 12
			bottomPadding: 3
			topPadding: 3
			textRole: qsTr("")
			anchors.verticalCenter: parent.verticalCenter
		}

	}

	RowLayout {
		id: videoQualityRow
		Layout.fillWidth: true
		spacing: 10
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0

		Label {
			id: video
			text: qsTr("Video")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		Slider {
			id: videoQualitySlider
			spacing: 0
			anchors.verticalCenter: parent.verticalCenter
			snapMode: Slider.SnapAlways
			Layout.fillWidth: true
		}


	}

	RowLayout {
		id: audioQualityRow
		Layout.fillWidth: true
		spacing: 10
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0

		Label {
			id: audio
			text: qsTr("Audio")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		Slider {
			id: audioQualitySlider
			anchors.verticalCenter: parent.verticalCenter
			snapMode: Slider.SnapAlways
			Layout.fillWidth: true
		}

	}

	RowLayout {
		id: patienceRow
		width: 100
		spacing: 10
		Layout.fillWidth: true

		Label {
			id: patience
			text: qsTr("Your patience")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		Slider {
			id: patienceSlider
			anchors.verticalCenter: parent.verticalCenter
			Layout.fillWidth: true
			snapMode: Slider.SnapAlways
		}
	}

	RowLayout {
		id: previewRow
		visible: true
		spacing: 0
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0
	}

	RowLayout {
		id: optionsRow
		width: 100
		height: 100
		Layout.fillWidth: true
		spacing: 0

		TextField {
			id: optionsGeneratedText
			text: qsTr("Text Field")
			enabled: false
			Layout.fillWidth: true
		}

		TextField {
			id: optionsCustomText
			text: qsTr("")
			Layout.fillWidth: true
		}
	}

	RowLayout {
		id: fileRow
		Layout.fillWidth: true
		spacing: 10
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0

		Label {
			id: saveTo
			text: qsTr("Save to")
			font.pointSize: 10
			anchors.verticalCenter: parent.verticalCenter
		}

		TextField {
			id: saveToScriptText
			text: qsTr("path(file) + '/' + basename(file) + '.' + containerExt")
			font.family: "Courier"
			Layout.fillWidth: true
			anchors.verticalCenter: parent.verticalCenter
		}
	}

	TextField {
		id: saveToResultText
		text: qsTr("")
		enabled: false
		Layout.fillWidth: true
	}



}
