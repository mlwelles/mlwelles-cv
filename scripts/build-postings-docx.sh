#!/usr/bin/env bash
set -e

for file in postings/[0-9a-f][0-9a-f]-michael-welles-resume.md postings/[0-9a-f][0-9a-f][0-9a-f]-michael-welles-resume.md postings/[0-9a-f][0-9a-f]-michael-welles-cover-letter.md postings/[0-9a-f][0-9a-f][0-9a-f]-michael-welles-cover-letter.md; do
    if [ -f "$file" ]; then
        basename="${file%.md}"
        docx="$basename.docx"

        # Only convert if DOCX doesn't exist or MD is newer
        if [ ! -f "$docx" ] || [ "$file" -nt "$docx" ]; then
            echo "Converting $file to DOCX..."
            source .venv/bin/activate && uv run scripts/markdown_resume_to_docx.py "$file" "$docx"
        else
            echo "Skipping $file (DOCX is up to date)"
        fi
    fi
done
