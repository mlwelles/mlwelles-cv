#!/usr/bin/env bash
set -e

# Check if ID was provided
if [ -z "$1" ]; then
    echo "Error: No ID provided"
    echo "Usage: just top-choice <id>"
    echo ""
    echo "Available job postings:"
    for posting in customized/[0-9a-f][0-9a-f]-*.md customized/[0-9a-f][0-9a-f][0-9a-f]-*.md; do
        if [ -f "$posting" ]; then
            filename=$(basename "$posting")
            # Skip if this is already a resume, cover letter, or top choice
            if [[ "$filename" == *"michael-welles-resume"* ]] || [[ "$filename" == *"michael-welles-cover-letter"* ]] || [[ "$filename" == *"top-choice"* ]]; then
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
        # Skip if this is already a resume, cover letter, or top choice
        if [[ "$filename" == *"michael-welles-resume"* ]] || [[ "$filename" == *"michael-welles-cover-letter"* ]] || [[ "$filename" == *"top-choice"* ]]; then
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

TOP_CHOICE="customized/$ID-top-choice.md"

if [ -f "$TOP_CHOICE" ]; then
    echo "Top choice document already exists: $TOP_CHOICE"
    echo "Overwriting..."
    echo ""
fi

echo "Generating top choice explanation for: $POSTING"
echo "  → Creating: $TOP_CHOICE"
echo ""

# Invoke Claude Code to generate the top choice explanation
# --print: non-interactive mode, auto-exit after completion
# --dangerously-skip-permissions: bypass all permission checks for automation
claude --print --dangerously-skip-permissions "Please create a VERY BRIEF explanation (MAXIMUM 400 characters) of why this role in $POSTING is a top choice for me and save it to $TOP_CHOICE. Focus on the specific match between my background and what makes this role uniquely appealing. Be direct and specific. This is NOT a cover letter - it's a short internal note explaining why this is a priority application. Every word must count. Aim for 2-3 sentences maximum."

echo ""
echo "✓ Top choice explanation generated: $TOP_CHOICE"
echo ""
echo "────────────────────────────────────────────────────────────────"
echo "Top Choice Content:"
echo "────────────────────────────────────────────────────────────────"
cat "$TOP_CHOICE"
echo "────────────────────────────────────────────────────────────────"
echo ""
echo "Character count: $(wc -c < "$TOP_CHOICE" | tr -d ' ')"
