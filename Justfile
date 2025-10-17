set shell := ["bash", "-lc"]

default: resume-pdf

resume-pdf: resume-tex
    pdflatex resume-michael-welles.tex

resume-tex:
    uv run scripts/markdown_resume_to_tex.py resume-michael-welles.md resume-michael-welles.tex

resume-md:
    uv run scripts/tex_resume_to_markdown.py resume-michael-welles.tex resume-michael-welles.md

resume-docx:
    uv run scripts/markdown_resume_to_docx.py resume-michael-welles.md resume-michael-welles.docx
