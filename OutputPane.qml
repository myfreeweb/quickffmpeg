import QtQuick 2.4
import Util 0.1

OutputPaneForm {
	property Util util: Util { }
	property string sourcePath

	videoFormats: [ "VP9", "H.265", "VP8", "H.264", "Theora" ]
	audioFormats: [ "Opus", "AAC", "Vorbis" ]
	containerFormats: [ "WebM", "MKV", "MP4", "Ogg" ]

	videoQualityStep: 1
	videoQualityMin: 0
	videoQualityMax: switch (videoFormat) {
					 case "VP9":   case "VP8":   return 63
					 case "H.265": case "H.264": return 51
					 case "Theora":              return 10
					 default: return 1
					 }

	audioQualityMin: 0
	audioQualityStep: 1
	audioQualityMax: switch (audioFormat) {
					 default: return 1
					 }

	patienceMin: 0
	patienceStep: 1
	patienceMax: switch (videoFormat) {
				 case "VP9":    return 4
				 case "H.265":  return 4
				 case "VP8":    return 4
				 case "H.264":  return 4
				 case "Theora": return 1
				 default: return 1
				 }

	optionsGenerated: {
		var opts = '-c:v '
		switch (videoFormat) {
		case "VP9":    opts += 'vp9';    break
		case "H.265":  opts += 'x265';   break
		case "VP8":    opts += 'vp8';    break
		case "H.264":  opts += 'x264';   break
		case "Theora": opts += 'theora'; break
		default: break
		}
		opts += ' -c:a '
		switch (audioFormat) {
		case "Opus":   opts += 'opus';   break
		case "AAC":    opts += 'aac';    break
		case "Vorbis": opts += 'vorbis'; break
		default: break
		}
		opts += ' -f '
		switch (containerFormat) {
		case "WebM":  opts += 'webm';  break
		case "MP4":   opts += 'mp4';   break
		case "MKV":   opts += 'mkv';   break
		}
		return opts
	}

	saveToResult: {
		try {
			var containerExt
			switch (containerFormat) {
			case "WebM":  containerExt = 'webm';  break
			case "MP4":   containerExt = 'mp4';   break
			case "MKV":   containerExt = 'mkv';   break
			}
			var basename = function (x) { return util.basename(x) }
			var result = new Function('Qt', 'path', 'basename', 'lastbasename', 'filename', 'dirname', 'ext', 'lastext', 'file', 'containerExt',
									  '"use strict";return ' + saveToScript)
			.call({}, undefined, util.path, util.basename, util.lastbasename, util.filename, util.dirname, util.ext, util.lastext, sourcePath, containerExt)
			return result
		} catch (e) {
			return 'ERROR: ' + e.message
		}
	}
}
