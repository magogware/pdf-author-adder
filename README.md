# pdf-metadata-script
Small script to set a proper title and author as metadata for all PDFs in a directory.

## Requirements
Must have Ghostscript and Python installed.

## Usage
To run the script, just supply an author name followed by as many PDFs as you
want. The script generates titles by replacing underscores in a filename with
spaces and then capitalising every word. For example, "my_file.pdf" will have
a metadata title of "My File" (sans quotation marks).
