# Repository Guidelines

## Project Structure & Module Organization
The Markdown résumé (`resume-michael-welles.md`) is the authoritative source. `scripts/` contains Python converters that translate between Markdown and the LaTeX layout (`resume-michael-welles.tex`). Generated artifacts—`.tex`, `.pdf`, `.aux`, `.log`, `.out`—live at the repository root and should be treated as build outputs. `Pictures/` holds embeddable assets such as `mlw-portrait.jpg`. Keep ancillary notes or draft content inside `entries/` so they do not pollute the published résumé.

## Build, Test, and Development Commands
Run `just resume-pdf` to regenerate the LaTeX file and compile a PDF in one step (requires `python3`, `pdflatex`, and `just`). Use `just resume-tex` when you only want to refresh the LaTeX from Markdown, or `just resume-md` to reverse the conversion after editing LaTeX directly. Invoke these commands from the repository root; `just` handles intermediate files automatically.

## Coding Style & Naming Conventions
Python utilities in `scripts/` follow PEP 8: four-space indentation, lowercase_with_underscores for functions, and type hints where practical. Strings that produce LaTeX templates should remain triple-quoted and keep comment headers intact. When editing Markdown content, prefer concise bullet statements and one sentence per bullet to match the publication style. Generated LaTeX should preserve the moderncv structure and avoid manual spacing tweaks unless absolutely necessary.

## Testing Guidelines
There is no standalone test suite; treat a clean `just resume-pdf` run with zero LaTeX warnings as the regression check. Before submitting changes, open the resulting `resume-michael-welles.pdf` to confirm layout, typography, and hyperlinks. If you touch the conversion scripts, validate both directions (`resume-pdf` and `resume-md`) to ensure round-trip fidelity and diff the Markdown for unintended formatting shifts.

## Commit & Pull Request Guidelines
Commit history favors Conventional Commits (`build:`, `feat:`, `chore:`). Continue that style with concise, imperative summaries (e.g., `feat: add open-source projects section`). For pull requests, include: goal-oriented summary, screenshots or PDF excerpts when layout changes occur, linked issues (if any), and a checklist of commands run (`just resume-pdf`, etc.). Note any external dependencies added so reviewers can reproduce the build.

## Asset & Configuration Notes
Optimize new images for print (300 dpi) and keep filenames descriptive, e.g., `Pictures/company-logo.png`. Configuration files such as `Justfile` and `.sty` themes should stay ASCII; document non-obvious parameters inline with brief comments when defaults change.
