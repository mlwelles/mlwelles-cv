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
if [[ "$OS" == "macos" ]]; then
    # On macOS, check for soffice binary in LibreOffice.app
    if [ ! -f "/Applications/LibreOffice.app/Contents/MacOS/soffice" ]; then
        echo "libreoffice not found. Installing..."
        brew install --cask libreoffice
    else
        echo "✓ libreoffice is installed"
    fi
else
    # On Linux, check for libreoffice command
    if ! command -v libreoffice &> /dev/null; then
        echo "libreoffice not found. Installing..."
        sudo apt-get update
        sudo apt-get install -y libreoffice
    else
        echo "✓ libreoffice is installed"
    fi
fi

# Check and install TexLive (for pdflatex)
if ! command -v pdflatex &> /dev/null; then
    echo "pdflatex not found. Installing TexLive..."
    if [[ "$OS" == "macos" ]]; then
        brew install --cask basictex
        echo "Note: BasicTeX installed. You may need to run 'eval \"\$(/usr/libexec/path_helper)\"' to update PATH"
        echo "or restart your shell. If you need additional LaTeX packages, use 'tlmgr install <package>'"
    elif [[ "$OS" == "linux" ]]; then
        sudo apt-get update
        sudo apt-get install -y texlive-latex-base texlive-latex-extra
    fi
else
    echo "✓ pdflatex is installed"
fi

echo ""
echo "All dependencies are installed!"
echo ""
echo "Note: If uv, Homebrew, or TexLive was just installed, you may need to restart your shell"
echo "or source the appropriate environment file."
