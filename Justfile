set shell := ["bash", "-lc"]

default: resume-docx resume-docx-pdf

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
