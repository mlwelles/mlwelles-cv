#!/usr/bin/env python3
"""Convert the LaTeX resume to a Markdown version with preserved structure."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional


COMMAND_ARG_PATTERN = re.compile(r"\{([^{}]*)\}")


def extract_args(command: str, expected: Optional[int] = None) -> List[str]:
    """Return all top-level brace arguments from a LaTeX command."""
    args = COMMAND_ARG_PATTERN.findall(command)
    if expected is not None and len(args) != expected:
        raise ValueError(f"Expected {expected} args, found {len(args)} in: {command}")
    return args


def clean_text(text: str) -> str:
    """Convert common LaTeX escape sequences to plain text."""
    replacements = {
        r"\&": "&",
        r"---": "—",
        r"--": "–",
        r"``": '"',
        r"''": '"',
        r"\%": "%",
        r"\_": "_",
        r"~": " ",
        r"\,": " ",
        r"\ldots": "...",
    }
    for key, value in replacements.items():
        text = text.replace(key, value)
    # Remove remaining TeX commands that wrap content we do not expect.
    text = re.sub(r"\\textit\{([^}]*)\}", r"\1", text)
    text = re.sub(r"\\textbf\{([^}]*)\}", r"\1", text)
    text = re.sub(r"\s+", " ", text)
    return text.strip()


def render_entry(entry: Dict[str, Any]) -> List[str]:
    """Render a structured entry (from \\cventry) into Markdown lines."""
    lines: List[str] = []
    role = entry["role"]
    employer = entry["employer"]
    header_parts = [part for part in [role, employer] if part]
    if header_parts:
        lines.append(f"### {', '.join(header_parts)}")
    dates = entry.get("dates")
    location = entry.get("location")
    italic_bits = [bit for bit in [dates, location] if bit]
    if italic_bits:
        lines.append(f"*{' · '.join(italic_bits)}*")
    summary = entry.get("summary")
    if summary:
        lines.append("")
        lines.append(summary)
    bullets = entry.get("bullets", [])
    if bullets:
        lines.append("")
        for bullet in bullets:
            lines.append(f"- {bullet}")
    lines.append("")
    return lines


def iter_commands(lines: List[str]) -> List[str]:
    """Yield logical LaTeX commands, combining multi-line definitions."""
    commands: List[str] = []
    buffer = ""
    depth = 0
    capturing = False

    for raw in lines:
        stripped = raw.strip()
        if not stripped or stripped.startswith("%"):
            continue

        if capturing:
            buffer += " " + stripped
            depth += stripped.count("{") - stripped.count("}")
            if depth <= 0:
                commands.append(buffer.strip())
                buffer = ""
                capturing = False
            continue

        if stripped.startswith("\\cventry") or stripped.startswith("\\cvline"):
            buffer = stripped
            depth = stripped.count("{") - stripped.count("}")
            if depth > 0:
                capturing = True
            else:
                commands.append(buffer.strip())
            continue

        commands.append(stripped)

    if buffer:
        commands.append(buffer.strip())
    return commands


def parse_resume(tex_path: Path) -> Dict[str, Any]:
    """Parse the LaTeX resume into a structured representation."""
    raw_lines = tex_path.read_text(encoding="utf-8").splitlines()
    content = iter_commands(raw_lines)
    data: Dict[str, Any] = {"sections": []}
    current_section: Optional[Dict[str, Any]] = None
    current_entry: Optional[Dict[str, Any]] = None

    section_order: List[Dict[str, Any]] = []

    for raw_line in content:
        line = raw_line.strip()
        if not line or line.startswith("%"):
            continue
        if line.startswith(r"\firstname"):
            data["first_name"] = clean_text(extract_args(line, 1)[0])
        elif line.startswith(r"\familyname"):
            data["last_name"] = clean_text(extract_args(line, 1)[0])
        elif line.startswith(r"\address"):
            args = extract_args(line, 2)
            address = clean_text(args[0])
            address_extra = clean_text(args[1])
            data["address"] = ", ".join(part for part in [address, address_extra] if part)
        elif line.startswith(r"\phone"):
            data["phone"] = clean_text(extract_args(line, 1)[0])
        elif line.startswith(r"\email"):
            data["email"] = clean_text(extract_args(line, 1)[0])
        elif line.startswith(r"\section"):
            title = clean_text(extract_args(line, 1)[0])
            current_section = {"title": title, "content": []}
            section_order.append(current_section)
            current_entry = None
        elif line.startswith(r"\cventry"):
            if current_section is None:
                raise ValueError("Encountered \\cventry before any \\section declaration.")
            args = extract_args(line, 6)
            dates = clean_text(args[0])
            role = clean_text(args[1])
            employer = clean_text(args[2])
            city = clean_text(args[3])
            state = clean_text(args[4])
            location_parts = [part for part in [city, state] if part]
            location = ", ".join(location_parts) if location_parts else ""
            summary = clean_text(args[5])
            entry = {
                "dates": dates or None,
                "role": role or None,
                "employer": employer or None,
                "location": location or None,
                "summary": summary or None,
                "bullets": [],
            }
            current_section["content"].append({"type": "entry", "value": entry})
            current_entry = entry
        elif line.startswith(r"\cvline"):
            args = extract_args(line, 2)
            label = clean_text(args[0])
            text = clean_text(args[1])
            if not text:
                continue
            if label == "-":
                if current_entry is not None:
                    current_entry["bullets"].append(text)
                elif current_section is not None:
                    current_section["content"].append({"type": "bullet", "value": text})
            else:
                target_entry = current_entry if current_entry is not None else None
                if target_entry is not None and label:
                    target_entry["bullets"].append(f"**{label}:** {text}")
                elif current_section is not None:
                    current_section["content"].append({"type": "paragraph", "value": text})
        else:
            continue

    data["sections"] = section_order
    return data


def render_markdown(parsed: Dict[str, Any]) -> str:
    """Render the parsed resume into Markdown."""
    lines: List[str] = []
    full_name = " ".join(
        part for part in [parsed.get("first_name"), parsed.get("last_name")] if part
    )
    if full_name:
        lines.append(f"# {full_name}")

    contact_lines = [
        ("Address", parsed.get("address")),
        ("Phone", parsed.get("phone")),
        ("Email", parsed.get("email")),
    ]
    contact_items = [f"- **{label}:** {value}" for label, value in contact_lines if value]
    if contact_items:
        lines.extend(contact_items)
        lines.append("")

    for section in parsed["sections"]:
        title = section["title"]
        if title:
            lines.append(f"## {title}")
        lines.append("")
        for item in section["content"]:
            if item["type"] == "paragraph":
                lines.append(item["value"])
                lines.append("")
            elif item["type"] == "bullet":
                lines.append(f"- {item['value']}")
                lines.append("")
            elif item["type"] == "entry":
                lines.extend(render_entry(item["value"]))
        # Ensure a blank line between sections
        if lines and lines[-1] != "":
            lines.append("")
    # Remove trailing blank lines
    while lines and lines[-1] == "":
        lines.pop()
    return "\n".join(lines) + "\n"


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Convert resume-michael-welles.tex into Markdown."
    )
    parser.add_argument("input", type=Path, help="Path to the LaTeX resume.")
    parser.add_argument(
        "output",
        nargs="?",
        type=Path,
        help="Where to write the Markdown output. Defaults to stdout.",
    )
    args = parser.parse_args(argv)

    parsed = parse_resume(args.input)
    markdown = render_markdown(parsed)

    if args.output:
        args.output.write_text(markdown, encoding="utf-8")
    else:
        sys.stdout.write(markdown)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
