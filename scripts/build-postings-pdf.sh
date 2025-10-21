#!/usr/bin/env bash
set -e

# Set LibreOffice path based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    LIBREOFFICE="/Applications/LibreOffice.app/Contents/MacOS/soffice"
else
    LIBREOFFICE="libreoffice"
fi

for file in postings/[0-9a-f][0-9a-f]-michael-welles-resume.docx postings/[0-9a-f][0-9a-f][0-9a-f]-michael-welles-resume.docx postings/[0-9a-f][0-9a-f]-michael-welles-cover-letter.docx postings/[0-9a-f][0-9a-f][0-9a-f]-michael-welles-cover-letter.docx; do
    if [ -f "$file" ]; then
        echo "Converting $file to PDF..."
        "$LIBREOFFICE" --headless --convert-to pdf --outdir postings "$file"
    fi
done
