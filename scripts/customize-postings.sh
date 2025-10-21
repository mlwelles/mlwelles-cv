#!/usr/bin/env bash
set -e

echo "Checking for job postings that need tailored resumes and cover letters..."
echo ""

missing_resumes=0
missing_cover_letters=0

# Find all posting files matching [id]-[NAME].md pattern
# Supports both 2-char (00, 0a) and 3-char (000, 1aa) ID prefixes
for posting in postings/[0-9a-f][0-9a-f]-*.md postings/[0-9a-f][0-9a-f][0-9a-f]-*.md; do
    if [ -f "$posting" ]; then
        # Extract the ID from the filename (everything before the first hyphen)
        filename=$(basename "$posting")
        id="${filename%%-*}"

        # Check if corresponding resume exists
        resume="postings/$id-michael-welles-resume.md"

        if [ ! -f "$resume" ]; then
            echo "Missing resume for: $posting"
            echo "  → Creating: $resume"
            echo ""

            # Invoke Claude Code to generate the tailored resume
            # --print: non-interactive mode, auto-exit after completion
            # --dangerously-skip-permissions: bypass all permission checks for automation
            claude --print --dangerously-skip-permissions "Please create a tuned version of the resume for the job description in $posting and save it to postings/$id-michael-welles-resume.md"

            ((missing_resumes++))
            echo ""
        fi

        # Check if corresponding cover letter exists
        cover_letter="postings/$id-michael-welles-cover-letter.md"

        if [ ! -f "$cover_letter" ]; then
            echo "Missing cover letter for: $posting"
            echo "  → Creating: $cover_letter"
            echo ""

            # Invoke Claude Code to generate the tailored cover letter
            # --print: non-interactive mode, auto-exit after completion
            # --dangerously-skip-permissions: bypass all permission checks for automation
            claude --print --dangerously-skip-permissions "Please create a cover letter for the job description in $posting and save it to postings/$id-michael-welles-cover-letter.md. Write it like a real person having a conversation, not a keyword-stuffed summary of the resume. Tell specific stories that connect past work to what they need. Be professional but conversational. Focus on why the work matters, not just listing credentials. Can be multiple paragraphs if needed to sound natural."

            ((missing_cover_letters++))
            echo ""
        fi
    fi
done

echo "Summary:"
if [ $missing_resumes -eq 0 ]; then
    echo "✓ All job postings have corresponding tailored resumes"
else
    echo "  Generated $missing_resumes tailored resume(s)"
fi
if [ $missing_cover_letters -eq 0 ]; then
    echo "✓ All job postings have corresponding cover letters"
else
    echo "  Generated $missing_cover_letters cover letter(s)"
fi
