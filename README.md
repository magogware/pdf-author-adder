# pdf-metadata-script
Small script to set a proper title and author as metadata for all PDFs in a directory.

## Requirements
Must have Ghostscript and Python installed.

## Usage
If using the script as is, just run the script in a directory with PDFs and supply an author name. As is, the script will generate a title by replacing underscores in the file name with spaces and capitalising all words. For example, "my_file.pdf" will have a metadata title of "My File" (sans quotation marks).
