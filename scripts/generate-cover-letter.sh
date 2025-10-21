#!/usr/bin/env bash
set -e

# Check if ID was provided
if [ -z "$1" ]; then
    echo "Error: No ID provided"
    echo "Usage: just cover-letter <id>"
    echo ""
    echo "Available job postings:"
    for posting in customized/[0-9a-f][0-9a-f]-*.md customized/[0-9a-f][0-9a-f][0-9a-f]-*.md; do
        if [ -f "$posting" ]; then
            filename=$(basename "$posting")
            # Skip if this is already a resume or cover letter
            if [[ "$filename" == *"michael-welles-resume"* ]] || [[ "$filename" == *"michael-welles-cover-letter"* ]]; then
                continue
            fi
            id="${filename%%-*}"
            echo "  $id - $posting"
        fi
    done
    exit 1
fi

ID="$1"

# Find the job posting file for this ID
POSTING=""
for posting in customized/$ID-*.md; do
    if [ -f "$posting" ]; then
        filename=$(basename "$posting")
        # Skip if this is already a resume or cover letter
        if [[ "$filename" == *"michael-welles-resume"* ]] || [[ "$filename" == *"michael-welles-cover-letter"* ]]; then
            continue
        fi
        POSTING="$posting"
        break
    fi
done

if [ -z "$POSTING" ]; then
    echo "Error: No job posting found for ID: $ID"
    echo "Looking for: customized/$ID-*.md"
    exit 1
fi

COVER_LETTER="customized/$ID-michael-welles-cover-letter.md"

if [ -f "$COVER_LETTER" ]; then
    echo "Cover letter already exists: $COVER_LETTER"
    echo "Overwriting..."
    echo ""
fi

echo "Generating cover letter for: $POSTING"
echo "  → Creating: $COVER_LETTER"
echo ""

# Invoke Claude Code to generate the tailored cover letter
# --print: non-interactive mode, auto-exit after completion
# --dangerously-skip-permissions: bypass all permission checks for automation
claude --print --dangerously-skip-permissions "Please create a BRIEF and CONCISE cover letter for the job description in $POSTING and save it to $COVER_LETTER. Keep it short - aim for 2-3 paragraphs maximum. Write it like a real person having a conversation, not a keyword-stuffed summary of the resume.  If you choose tto tell a specific story (not necessarily required), tell NO MORE than ONE that connects past work to what they need  choose by prioritizing both recencency and strength of connection. Be professional but conversational. Focus on why the work matters, not just listing credentials. Every sentence should add value - remove anything that doesn't directly strengthen the case.  Try to write short simple sentances and avoid sentances with many commans, em-dashes, semi-colons, etc..."

echo ""
echo "✓ Cover letter generated: $COVER_LETTER"
echo ""
echo "────────────────────────────────────────────────────────────────"
echo "Cover Letter Content:"
echo "────────────────────────────────────────────────────────────────"
cat "$COVER_LETTER"
echo "────────────────────────────────────────────────────────────────"
echo ""

# Generate DOCX version
COVER_LETTER_DOCX="customized/$ID-michael-welles-cover-letter.docx"
echo "Converting to DOCX..."
source .venv/bin/activate && uv run scripts/markdown_to_docx.py "$COVER_LETTER" "$COVER_LETTER_DOCX"
echo "✓ DOCX generated: $COVER_LETTER_DOCX"
echo ""

# Generate PDF version
COVER_LETTER_PDF="customized/$ID-michael-welles-cover-letter.pdf"
echo "Converting to PDF..."

# Set LibreOffice path based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    LIBREOFFICE="/Applications/LibreOffice.app/Contents/MacOS/soffice"
else
    LIBREOFFICE="libreoffice"
fi

"$LIBREOFFICE" --headless --convert-to pdf --outdir customized "$COVER_LETTER_DOCX"
echo "✓ PDF generated: $COVER_LETTER_PDF"
echo ""
echo "All formats generated successfully!"
