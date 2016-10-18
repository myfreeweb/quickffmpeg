import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.5
import FFVideoSource 0.1
import Util 0.1

InputPaneForm {
	property string path
	outputPanesHeight: 640 * outputsModel.count
	width: 480

	ListModel {
		id: outputsModel
		ListElement { videoQuality: 40; audioQuality: 0 }
		ListElement { videoQuality: 20; audioQuality: 0 }
	}

	ListView {
		id: outputsList
		model: outputsModel
		width: 480
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		delegate: Item {
			width: outputsList.width
			height: 640
			OutputPane {
				anchors.fill: parent
				sourcePath: path
				videoQuality: model.videoQuality

				FFVideoSource {
					id: videoProducer
					fileUrl: "file:" + path
					ffmpegUrl: "file:C:/Users/greg/Downloads/ffmpeg-20160812-e8b355a-win64-static/bin/ffmpeg.exe"
					ffprobeUrl: "file:C:/Users/greg/Downloads/ffmpeg-20160812-e8b355a-win64-static/bin/ffprobe.exe"
				}

				VideoOutput {
					Layout.fillHeight: true
					Layout.fillWidth: true
					anchors.fill: parent
					source: videoProducer
					MouseArea {
						anchors.fill: parent
						hoverEnabled: true
						onEntered: videoProducer.start()
						onExited: videoProducer.stop()
					}
				}
			}
		}
	}

	FileDialog {
		id: fileDialog
		onAccepted: browseInput.text = fileDialog.fileUrl.toString().slice(8)
	}

	browseButton.onClicked: fileDialog.open()
}
