#!/usr/bin/env bash
set -e

echo "Checking for job postings that need tailored resumes..."
echo ""

missing_resumes=0

# Find all posting files matching [id]-[NAME].md pattern
# Supports both 2-char (00, 0a) and 3-char (000, 1aa) ID prefixes
for posting in customized/[0-9a-f][0-9a-f]-*.md customized/[0-9a-f][0-9a-f][0-9a-f]-*.md; do
    if [ -f "$posting" ]; then
        # Extract the ID from the filename (everything before the first hyphen)
        filename=$(basename "$posting")
        id="${filename%%-*}"

        # Skip if this is already a resume or cover letter
        if [[ "$filename" == *"michael-welles-resume"* ]] || [[ "$filename" == *"michael-welles-cover-letter"* ]]; then
            continue
        fi

        # Check if corresponding resume exists
        resume="customized/$id-michael-welles-resume.md"

        if [ ! -f "$resume" ]; then
            echo "Missing resume for: $posting"
            echo "  → Creating: $resume"
            echo ""

            # Invoke Claude Code to generate the tailored resume
            # --print: non-interactive mode, auto-exit after completion
            # --dangerously-skip-permissions: bypass all permission checks for automation
            claude --print --dangerously-skip-permissions "Please create a tuned version of the resume for the job description in $posting and save it to customized/$id-michael-welles-resume.md"

            ((missing_resumes++))
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
echo ""
echo "To generate a cover letter for a job posting, run: just cover-letter <id>"
