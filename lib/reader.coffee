###
PDFReader - represents an entire PDF document
By Devon Govett
###

return if not require('streamline/module')(module)
fs = require 'fs'

class PDFReader
	constructor: (_,filename) ->
		@filename = filename
		@data = @read(_)
		@startOffset = 0
		@pdfVersion = @checkPdfHeader(_)

	@create: (_,filename) ->
		new PDFReader(_,filename)

	read: (_) ->
		return fs.readFile @filename,'binary', _

	checkPdfHeader: (_) ->
		@startOffset = 0
		str = @data.toString().slice(@startOffset,1024)
		idx = str.indexOf("%PDF-")
		if (idx < 0)
			throw new Error("PDF header signature not found.")
		@startOffset = idx
		return str.charAt(idx + 7)

	toString: () ->
		"[object PDFReader]"
        
module.exports = PDFReader