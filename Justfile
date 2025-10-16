set shell := ["bash", "-lc"]

default: build

build: resume-pdf resume-md

resume-pdf:
    pdflatex resume-michael-welles.tex

resume-md:
    python3 scripts/tex_resume_to_markdown.py resume-michael-welles.tex resume-michael-welles.md

resume-tex:
    python3 scripts/markdown_resume_to_tex.py resume-michael-welles.md resume-michael-welles.tex
