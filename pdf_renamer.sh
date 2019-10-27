#!/bin/bash

# Get current date
date=$(date +%Y%m%d%H%M%S)

# Check script is being used properly
if [ "$#" < 3 ]; then
	echo "Usage: pdf_renamer.sh authorname pdf(s)"
	exit 1
fi

# Get author and delete it from
# the array of arguments
author=$1
shift

# Loop through files given
# as arguments
while (( "$#" )); do

	# Give a status update
	echo -n "Processing file $1... "

	# Convert file name to a title
	bare=$(basename --suffix=".pdf" $1)
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
	gs -q -o new_$1 -sDEVICE=pdfwrite $1 docinfo.pdfmark 

	# Overwrite old file
	rm $1
	mv new_$1 $1

	# Remove pdfmark file
	rm docinfo.pdfmark

	# Status update
	echo "Done."

	# Remove this file from the array
	shift
done
exit 0
