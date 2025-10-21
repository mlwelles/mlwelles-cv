set shell := ["zsh", "-c"]

# Set LibreOffice path based on OS
LIBREOFFICE := if os() == "macos" {
    "/Applications/LibreOffice.app/Contents/MacOS/soffice"
} else {
    "libreoffice"
}

default: resume customized

deps:
    ./scripts/check-deps.sh

resume: resume-docx resume-pdf

resume-tex-pdf: resume-tex
    pdflatex resume-michael-welles.tex

resume-tex:
    source .venv/bin/activate && uv run scripts/markdown_resume_to_tex.py resume-michael-welles.md resume-michael-welles.tex

#resume-md:
#    source .venv/bin/activate && uv run scripts/tex_resume_to_markdown.py resume-michael-welles.tex resume-michael-welles.md

resume-docx:
    #!/usr/bin/env bash
    if [ ! -f resume-michael-welles.docx ] || [ resume-michael-welles.md -nt resume-michael-welles.docx ]; then \
        echo "Building resume-michael-welles.docx..."; \
        source .venv/bin/activate && uv run scripts/markdown_resume_to_docx.py resume-michael-welles.md resume-michael-welles.docx; \
    else \
        echo "resume-michael-welles.docx is up to date"; \
    fi

resume-pdf: resume-docx
    #!/usr/bin/env bash
    if [ ! -f resume-michael-welles.pdf ] || [ resume-michael-welles.docx -nt resume-michael-welles.pdf ]; then \
        echo "Building resume-michael-welles.pdf..."; \
        {{LIBREOFFICE}} --headless --convert-to pdf --outdir . resume-michael-welles.docx; \
    else \
        echo "resume-michael-welles.pdf is up to date"; \
    fi

customized: customize customized-docx customized-pdf

customized-docx:
    ./scripts/build-customized-docx.sh

customized-pdf: customized-docx
    ./scripts/build-customized-pdf.sh

customize:
    ./scripts/generate-customized-markdown.sh

cover-letter id:
    ./scripts/generate-cover-letter.sh {{id}}
