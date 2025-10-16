.PHONY: build resume-md resume-tex
DEFAULT: build

build: resume-pdf resume-md

resume-pdf: resume-michael-welles.tex
	pdflatex resume-michael-welles.tex

resume-md: resume-michael-welles.md

resume-michael-welles.md: resume-michael-welles.tex scripts/tex_resume_to_markdown.py
	python3 scripts/tex_resume_to_markdown.py $< $@

resume-tex: scripts/markdown_resume_to_tex.py resume-michael-welles.md
	python3 scripts/markdown_resume_to_tex.py resume-michael-welles.md resume-michael-welles.tex
