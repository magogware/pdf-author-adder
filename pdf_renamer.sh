#!/bin/bash

date=$(date +%Y%m%d%H%M%S)
for f in *pdf
do
	# Give a status update
	echo -n "Processing file $f... "

	# Convert file name to a title
	bare=$(basename --suffix=".pdf" $f)
	title=$(echo $bare | tr _ ' ' | sed -e "s/\b\(.\)/\u\1/g")

	# Write metadata to pdfmark file
	echo "[ /Title ($title)" > docinfo.pdfmark
	echo "  /Author ($1)" >> docinfo.pdfmark
	echo "  /Subject (PDF)" >> docinfo.pdfmark
	echo "  /Creator (PDF Renamer)" >> docinfo.pdfmark
	echo "  /ModDate (D:$date+10'00')" >> docinfo.pdfmark
	echo "  /Producer (Ghostscript)" >> docinfo.pdfmark
	echo "  /Keywords (Ghostscript, PDF)" >> docinfo.pdfmark
	echo "  /CreationDate (D:$date+10'00')" >> docinfo.pdfmark
	echo "  /DOCINFO" >> docinfo.pdfmark
	echo "pdfmark" >> docinfo.pdfmark

	# Overwrite file with metadata
	gs -q -o new_$f -sDEVICE=pdfwrite $f docinfo.pdfmark 

	# Remove pdfmark file
	rm docinfo.pdfmark

	# Status update
	echo "Done."
done



