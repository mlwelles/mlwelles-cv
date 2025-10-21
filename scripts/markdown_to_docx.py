#!/usr/bin/env python3
"""Convert Markdown document to a simple styled DOCX document.
This is a simpler converter for documents like cover letters."""

import sys
from pathlib import Path
from docx import Document
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH


def create_simple_docx(md_path, output_path):
    """Create a simple DOCX from markdown paragraphs."""
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()

    doc = Document()

    # Set document margins
    section = doc.sections[0]
    section.top_margin = Inches(1.0)
    section.bottom_margin = Inches(1.0)
    section.left_margin = Inches(1.0)
    section.right_margin = Inches(1.0)

    # Process each paragraph
    paragraphs = content.split('\n\n')

    for para_text in paragraphs:
        para_text = para_text.strip()
        if not para_text:
            continue

        # Add paragraph
        p = doc.add_paragraph(para_text)
        p.runs[0].font.size = Pt(11)
        p.runs[0].font.name = 'Calibri'
        p.paragraph_format.space_after = Pt(12)
        p.paragraph_format.line_spacing = 1.15

    doc.save(output_path)
    print(f"Created styled DOCX: {output_path}")


def main():
    if len(sys.argv) < 3:
        print("Usage: markdown_to_docx.py <input.md> <output.docx>")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])

    if not input_path.exists():
        print(f"Error: Input file not found: {input_path}")
        sys.exit(1)

    create_simple_docx(input_path, output_path)


if __name__ == '__main__':
    main()
