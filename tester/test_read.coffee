return if not require('streamline/module')(module)
PDFReader = require '../lib/reader'



# Create a new PDFReader


doc = PDFReader.create(_, "./test.pdf")

console.log "PDF Version : " + doc.pdfVersion