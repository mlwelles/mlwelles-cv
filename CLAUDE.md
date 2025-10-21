# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Michael Welles' CV/resume repository that maintains both LaTeX and Markdown versions of his resume. The project uses a dual-format approach where the primary source is Markdown (`resume-michael-welles.md`) and LaTeX is generated from it for PDF production.

## Architecture

The repository contains:
- **Source document**: `resume-michael-welles.md` - The primary Markdown resume
- **Generated LaTeX**: `resume-michael-welles.tex` - Generated from Markdown
- **PDF output**: `resume-michael-welles.pdf` - Final compiled resume
- **Conversion scripts**: Python scripts in `scripts/` directory for format conversion
- **LaTeX styling**: ModernCV class and style files for professional resume formatting

## Build System

The project uses `just` as the task runner (see `Justfile`):

### Primary Commands
- `just` or `just resume-pdf` - Build the complete PDF resume (default)
- `just resume-tex` - Convert Markdown to LaTeX format
- `just resume-md` - Convert LaTeX back to Markdown (reverse conversion)

### Build Process
1. `resume-md` → `resume-tex` → `resume-pdf`
2. Markdown is converted to LaTeX using `scripts/markdown_resume_to_tex.py`
3. LaTeX is compiled to PDF using `pdflatex`

## Development Workflow

1. **Edit the Markdown**: Make changes to `resume-michael-welles.md`
2. **Generate LaTeX**: Run `just resume-tex` to convert to LaTeX
3. **Build PDF**: Run `just resume-pdf` to generate the final PDF
4. **Reverse conversion**: Use `just resume-md` if you need to extract content from LaTeX back to Markdown

## File Dependencies

- The conversion scripts require Python 3
- LaTeX compilation requires `pdflatex` and ModernCV class
- The build process is fully automated through the Justfile

## Key Scripts

- `scripts/markdown_resume_to_tex.py` - Converts Markdown to LaTeX with ModernCV formatting
- `scripts/tex_resume_to_markdown.py` - Reverse conversion from LaTeX to Markdown
- Always run any python commands with uv

## Writing Style Preferences

When editing resume text or other written content in this repository:

- **Conciseness**: Use clear, direct language. Remove unnecessary words and verbose phrasing.
- **Clarity**: Ensure technical concepts and accomplishments are easy to understand. Avoid jargon unless industry-standard.
- **Avoid Redundancies**: Don't repeat the same concept multiple times in close proximity (e.g., don't use "regulated industries" and "highly regulated environments" in the same paragraph).
- **Active Voice**: Prefer active constructions over passive where possible.
- **Specificity**: Include concrete details (metrics, technologies, outcomes) rather than vague descriptions.

Examples of improvements:
- ❌ "The platform comprised containerized Go gRPC microservices deployed on Kubernetes and exposed via a federated GraphQL API to a Vue.js frontend"
- ✅ "Built platform with Go microservices on Kubernetes, federated GraphQL API, and Vue.js frontend"