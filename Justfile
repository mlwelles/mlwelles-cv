set shell := ["zsh", "-c"]

# Set LibreOffice path based on OS
LIBREOFFICE := if os() == "macos" {
    "/Applications/LibreOffice.app/Contents/MacOS/soffice"
} else {
    "libreoffice"
}

default: resume-docx resume-docx-pdf postings

deps:
    ./scripts/check-deps.sh

resume-pdf: resume-tex
    pdflatex resume-michael-welles.tex

resume-tex:
    source .venv/bin/activate && uv run scripts/markdown_resume_to_tex.py resume-michael-welles.md resume-michael-welles.tex

resume-md:
    source .venv/bin/activate && uv run scripts/tex_resume_to_markdown.py resume-michael-welles.tex resume-michael-welles.md

resume-docx:
    source .venv/bin/activate && uv run scripts/markdown_resume_to_docx.py resume-michael-welles.md resume-michael-welles.docx

resume-docx-pdf: resume-docx
    {{LIBREOFFICE}} --headless --convert-to pdf --outdir . resume-michael-welles.docx

postings: postings-docx postings-pdf

postings-docx:
    ./scripts/build-postings-docx.sh

postings-pdf: postings-docx
    ./scripts/build-postings-pdf.sh

customize:
    ./scripts/customize-postings.sh
