#!/usr/bin/env python3
"""Convert the Markdown resume back into the LaTeX moderncv format."""

from __future__ import annotations

import argparse
import re
from pathlib import Path
from string import Template
from typing import Any, Dict, List, Optional, Tuple

DEFAULT_HEADER_TEMPLATE = Template(
    """%% MLW Resume
%% Derived from `template_en.tex'.
%% And jfb.tex
%% Copyright 2006-2008 Xavier Danaux (xdanaux@gmail.com).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

\\documentclass[letterpaper]{moderncv}

%\\moderncvstyle{classic} % CV theme - options include: 'casual' (default), 'classic', 'oldstyle' and 'banking'
%\\moderncvcolor{green} % CV color - options include: 'blue' (default), 'orange', 'green', 'red', 'purple', 'grey' and 'black'	

\\moderncvtheme[blue]{classic} 
\\usepackage[utf8]{inputenc} 

\\usepackage[scale=0.8]{geometry}% Reduce document margins
%\\setlength{\\hintscolumnwidth}{3cm} % Uncomment to change the width of the dates column
%\\setlength{\\makecvtitlenamewidth}{10cm} % For the 'classic' style, uncomment to adjust the width of the space allocated to your name

%\\AtBeginDocument{\\recomputelengths} 

% personal data
\\firstname{$first_name}
\\familyname{$last_name}
% All information in this block is optional, comment out any lines you don't need
%\\title{Curriculum Vitae}
\\address{$address_line1}{$address_line2}
\\phone{$phone}
\\email{$email}

%\\photo[70pt][0.4pt]{Pictures/mlw-portrait.jpg} % The first bracket is the picture height, the second is the thickness of the frame around the picture (0pt for no frame)
%----------------------------------------------------------------------------------------

\\begin{document}

%\\maketitle -- old, dont know what it does (mlw)
%----------------------------------------------------------------------------------------
%	CURRICULUM VITAE
%----------------------------------------------------------------------------------------
\\makecvtitle % Print the CV title

"""
)

DEFAULT_FOOTER = "\n\\end{document}\n"

EMPLOYER_SUFFIXES = {
    "llc",
    "inc",
    "inc.",
    "ltd",
    "ltd.",
    "co",
    "co.",
    "corp",
    "corp.",
    "plc",
    "pc",
    "llp",
    "sa",
    "gmbh",
}


def escape_latex(text: str) -> str:
    """Escape characters with special meaning in LaTeX."""
    replacements = {
        "\\": r"\textbackslash{}",
        "&": r"\&",
        "%": r"\%",
        "$": r"\$",
        "#": r"\#",
        "_": r"\_",
        "{": r"\{",
        "}": r"\}",
        "~": r"\textasciitilde{}",
        "^": r"\^{}",
    }
    escaped: List[str] = []
    for char in text:
        escaped.append(replacements.get(char, char))
    return "".join(escaped)


def split_name(full_name: str) -> Tuple[str, str]:
    parts = full_name.strip().split()
    if len(parts) > 1:
        return " ".join(parts[:-1]), parts[-1]
    return full_name.strip(), ""


def split_role_employer(text: str) -> Tuple[str, str]:
    segments = [segment.strip() for segment in text.split(",")]
    if len(segments) == 1:
        return segments[0], ""

    role_segments = segments[:-1]
    employer_parts = [segments[-1]]

    while role_segments and employer_parts[0].lower() in EMPLOYER_SUFFIXES:
        employer_parts.insert(0, role_segments.pop())

    role = ", ".join(role_segments).strip()
    employer = ", ".join(employer_parts).strip()
    return role, employer


def split_location(location: Optional[str]) -> Tuple[str, str]:
    if not location:
        return "", ""
    city_state = [part.strip() for part in location.split(",", 1)]
    if len(city_state) == 2:
        return city_state[0], city_state[1]
    return city_state[0], ""


def split_address(address: str) -> Tuple[str, str]:
    if not address:
        return "", ""
    parts = [part.strip() for part in address.split(",")]
    if len(parts) == 1:
        return parts[0], ""
    return parts[0], ", ".join(parts[1:]).strip()


def parse_italic_metadata(text: str) -> Tuple[Optional[str], Optional[str]]:
    parts = [part.strip() for part in text.split("·")]
    if not parts:
        return None, None
    if len(parts) == 1:
        value = parts[0]
        if any(char.isdigit() for char in value):
            return value or None, None
        return None, value or None
    dates = parts[0] or None
    location = " · ".join(parts[1:]).strip() or None
    return dates, location


def parse_markdown(md_path: Path) -> Dict[str, Any]:
    lines = md_path.read_text(encoding="utf-8").splitlines()
    data: Dict[str, Any] = {"sections": []}
    contact: Dict[str, str] = {}
    current_section: Optional[Dict[str, Any]] = None
    current_entry: Optional[Dict[str, Any]] = None
    entry_buffer: List[str] = []
    section_paragraph_buffer: List[str] = []

    def flush_entry_buffer() -> None:
        nonlocal entry_buffer, current_entry
        if current_entry and entry_buffer:
            paragraph = " ".join(entry_buffer).strip()
            if paragraph:
                current_entry["summary"].append(paragraph)
            entry_buffer = []

    def flush_section_paragraph() -> None:
        nonlocal section_paragraph_buffer, current_section
        if current_section and section_paragraph_buffer:
            paragraph = " ".join(section_paragraph_buffer).strip()
            if paragraph:
                current_section["items"].append({"type": "paragraph", "value": paragraph})
            section_paragraph_buffer = []

    for raw_line in lines:
        line = raw_line.strip()
        if not line:
            flush_entry_buffer()
            flush_section_paragraph()
            continue

        if line.startswith("# "):
            flush_entry_buffer()
            flush_section_paragraph()
            data["full_name"] = line[2:].strip()
            continue

        if line.startswith("- **") and current_section is None:
            match = re.match(r"- \*\*(.+?):\*\* (.+)", line)
            if match:
                label = match.group(1).strip().lower()
                value = match.group(2).strip()
                contact[label] = value
            continue

        if line.startswith("## "):
            flush_entry_buffer()
            flush_section_paragraph()
            section = {"title": line[3:].strip(), "items": []}
            data["sections"].append(section)
            current_section = section
            current_entry = None
            continue

        if line.startswith("### "):
            if current_section is None:
                raise ValueError("Encountered entry before any section definition.")
            flush_entry_buffer()
            flush_section_paragraph()
            role, employer = split_role_employer(line[4:].strip())
            entry = {
                "type": "entry",
                "role": role,
                "employer": employer,
                "dates": None,
                "location": None,
                "summary": [],
                "bullets": [],
            }
            current_section["items"].append(entry)
            current_entry = entry
            continue

        if (
            current_entry
            and line.startswith("*")
            and line.endswith("*")
            and not line.startswith("**")
        ):
            flush_entry_buffer()
            metadata = line[1:-1].strip()
            dates, location = parse_italic_metadata(metadata)
            if dates and not current_entry["dates"]:
                current_entry["dates"] = dates
            if location and not current_entry["location"]:
                current_entry["location"] = location
            continue

        if line.startswith("- ") and current_entry is not None:
            flush_entry_buffer()
            current_entry["bullets"].append(line[2:].strip())
            continue

        if line.startswith("- "):
            flush_entry_buffer()
            flush_section_paragraph()
            if current_section is not None:
                current_section["items"].append({"type": "bullet", "value": line[2:].strip()})
            continue

        if (
            line.startswith("*")
            and line.endswith("*")
            and not line.startswith("**")
            and current_section is not None
        ):
            flush_section_paragraph()
            current_section["items"].append({"type": "paragraph", "value": line[1:-1].strip()})
            continue

        if current_entry is not None:
            entry_buffer.append(line)
        elif current_section is not None:
            section_paragraph_buffer.append(line)

    flush_entry_buffer()
    flush_section_paragraph()
    data["contact"] = contact
    return data


def render_entry(entry: Dict[str, Any]) -> List[str]:
    dates = escape_latex(entry.get("dates") or "")
    role = escape_latex(entry.get("role") or "")
    employer = escape_latex(entry.get("employer") or "")
    city_raw, state_raw = split_location(entry.get("location"))
    city = escape_latex(city_raw)
    state = escape_latex(state_raw)
    summary_text = " ".join(entry.get("summary", []))
    summary = escape_latex(summary_text)

    lines = [
        f"\\cventry{{{dates}}}{{{role}}}{{{employer}}}{{{city}}}{{{state}}}{{{summary}}}"
    ]

    for bullet in entry.get("bullets", []):
        lines.append(f"\\cvline{{-}}{{{escape_latex(bullet)}}}")
    return lines


def render_section_items(items: List[Dict[str, Any]]) -> List[str]:
    lines: List[str] = []
    for item in items:
        if item["type"] == "entry":
            lines.extend(render_entry(item))
        elif item["type"] == "paragraph":
            lines.append(f"\\cvline{{}}{{{escape_latex(item['value'])}}}")
        elif item["type"] == "bullet":
            lines.append(f"\\cvline{{-}}{{{escape_latex(item['value'])}}}")
    lines.append("")
    return lines


def render_sections(sections: List[Dict[str, Any]]) -> str:
    lines: List[str] = []
    for section in sections:
        lines.append(f"\\section{{{escape_latex(section['title'])}}}")
        lines.append("")
        lines.extend(render_section_items(section["items"]))
    while lines and not lines[-1].strip():
        lines.pop()
    lines.append("")
    return "\n".join(lines) + "\n"


def extract_header_footer(template_text: str) -> Tuple[str, str]:
    section_match = re.search(r"\\section\{", template_text)
    end_match = re.search(r"\\end{document}", template_text)
    if not end_match:
        raise ValueError("Template missing \\end{document}.")
    header = template_text[: section_match.start()] if section_match else template_text[: end_match.start()]
    footer = template_text[end_match.start() :]
    return header, footer


def replace_single_arg_command(header: str, command: str, value: str) -> str:
    pattern = re.compile(rf"(\\{command}\{{)([^}}]*)(\}})")
    match = re.search(pattern, header)
    if match:
        return re.sub(
            pattern, lambda m: f"{m.group(1)}{value}{m.group(3)}", header, count=1
        )
    begin = re.search(r"\\begin\{document\}", header)
    insertion = f"\\{command}{{{value}}}\n"
    if begin:
        idx = begin.start()
        return header[:idx] + insertion + header[idx:]
    return header + ("\n" if not header.endswith("\n") else "") + insertion


def replace_double_arg_command(header: str, command: str, first: str, second: str) -> str:
    pattern = re.compile(rf"(\\{command}\{{)([^}}]*)(\}}\{{)([^}}]*)(\}})")
    match = re.search(pattern, header)
    if match:
        return re.sub(
            pattern,
            lambda m: f"{m.group(1)}{first}{m.group(3)}{second}{m.group(5)}",
            header,
            count=1,
        )
    begin = re.search(r"\\begin\{document\}", header)
    insertion = f"\\{command}{{{first}}}{{{second}}}\n"
    if begin:
        idx = begin.start()
        return header[:idx] + insertion + header[idx:]
    return header + ("\n" if not header.endswith("\n") else "") + insertion


def build_header(header_text: str, header_values: Dict[str, str]) -> str:
    result = header_text
    result = replace_single_arg_command(result, "firstname", header_values["first_name"])
    result = replace_single_arg_command(result, "familyname", header_values["last_name"])
    result = replace_double_arg_command(
        result, "address", header_values["address_line1"], header_values["address_line2"]
    )
    result = replace_single_arg_command(result, "phone", header_values["phone"])
    result = replace_single_arg_command(result, "email", header_values["email"])
    return result


def build_document(parsed: Dict[str, Any], template_text: Optional[str]) -> str:
    full_name = parsed.get("full_name", "")
    first_name, last_name = split_name(full_name)
    contact = parsed.get("contact", {})
    address_line1, address_line2 = split_address(contact.get("address", ""))

    header_values = {
        "first_name": escape_latex(first_name),
        "last_name": escape_latex(last_name),
        "address_line1": escape_latex(address_line1),
        "address_line2": escape_latex(address_line2),
        "phone": escape_latex(contact.get("phone", "")),
        "email": escape_latex(contact.get("email", "")),
    }

    if template_text:
        header_text, footer_text = extract_header_footer(template_text)
        header = build_header(header_text, header_values)
        footer = footer_text
    else:
        header = DEFAULT_HEADER_TEMPLATE.substitute(header_values)
        footer = DEFAULT_FOOTER

    body = render_sections(parsed["sections"])
    return header + body + footer


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convert resume Markdown back into the LaTeX moderncv source."
    )
    parser.add_argument("input", type=Path, help="Path to the Markdown resume.")
    parser.add_argument("output", type=Path, help="Destination path for the LaTeX resume.")
    parser.add_argument(
        "--template",
        type=Path,
        default=None,
        help="Optional template to use for the LaTeX header/footer (defaults to the output file if it exists).",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    parsed = parse_markdown(args.input)
    template_text: Optional[str] = None

    if args.template:
        template_text = args.template.read_text(encoding="utf-8")
    elif args.output.exists():
        template_text = args.output.read_text(encoding="utf-8")

    document = build_document(parsed, template_text)
    args.output.write_text(document, encoding="utf-8")


if __name__ == "__main__":
    main()
