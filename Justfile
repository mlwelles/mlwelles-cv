set shell := ["bash", "-lc"]

default: resume-docx resume-docx-pdf

deps:
    #!/usr/bin/env bash
    set -e

    # Detect OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi

    echo "Checking dependencies for $OS..."

    # Check and install Homebrew on macOS
    if [[ "$OS" == "macos" ]]; then
        if ! command -v brew &> /dev/null; then
            echo "Homebrew not found. Installing..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            echo "✓ Homebrew is installed"
        fi
    fi

    # Check and install uv
    if ! command -v uv &> /dev/null; then
        echo "uv not found. Installing..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
    else
        echo "✓ uv is installed"
    fi

    # Initialize uv venv if not present
    if [ ! -d ".venv" ]; then
        echo "Initializing uv virtual environment..."
        uv venv
    else
        echo "✓ uv virtual environment exists"
    fi

    # Sync uv dependencies
    echo "Syncing uv dependencies..."
    uv sync

    # Check and install pandoc
    if ! command -v pandoc &> /dev/null; then
        echo "pandoc not found. Installing..."
        if [[ "$OS" == "macos" ]]; then
            brew install pandoc
        elif [[ "$OS" == "linux" ]]; then
            sudo apt-get update
            sudo apt-get install -y pandoc
        fi
    else
        echo "✓ pandoc is installed"
    fi

    # Check and install libreoffice
    if ! command -v libreoffice &> /dev/null; then
        echo "libreoffice not found. Installing..."
        if [[ "$OS" == "macos" ]]; then
            brew install --cask libreoffice
        elif [[ "$OS" == "linux" ]]; then
            sudo apt-get update
            sudo apt-get install -y libreoffice
        fi
    else
        echo "✓ libreoffice is installed"
    fi

    echo ""
    echo "All dependencies are installed!"
    echo ""
    echo "Note: If uv or Homebrew was just installed, you may need to restart your shell"
    echo "or source the appropriate environment file."

resume-pdf: resume-tex
    pdflatex resume-michael-welles.tex

resume-tex:
    source .venv/bin/activate && uv run scripts/markdown_resume_to_tex.py resume-michael-welles.md resume-michael-welles.tex

resume-md:
    source .venv/bin/activate && uv run scripts/tex_resume_to_markdown.py resume-michael-welles.tex resume-michael-welles.md

resume-docx:
    source .venv/bin/activate && uv run scripts/markdown_resume_to_docx.py resume-michael-welles.md resume-michael-welles.docx

resume-docx-pdf: resume-docx
    libreoffice --headless --convert-to pdf --outdir . resume-michael-welles.docx

postings: postings-docx postings-pdf

postings-docx:
    #!/usr/bin/env bash
    for file in postings/resume-michael-welles*.md postings/cover-letter*.md; do \
        if [ -f "$file" ]; then \
            basename="${file%.md}"; \
            echo "Converting $file to DOCX..."; \
            source .venv/bin/activate && uv run scripts/markdown_resume_to_docx.py "$file" "$basename.docx"; \
        fi \
    done

postings-pdf: postings-docx
    #!/usr/bin/env bash
    for file in postings/resume-michael-welles*.docx postings/cover-letter*.docx; do \
        if [ -f "$file" ]; then \
            echo "Converting $file to PDF..."; \
            libreoffice --headless --convert-to pdf --outdir postings "$file"; \
        fi \
    done
