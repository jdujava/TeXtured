# TeXtured – Professional LaTeX Thesis Class

TeXtured is a professionally typeset LaTeX document class for academic theses, with emphasis on elegant typography, clean code structure, and modern LaTeX conventions.

## Features

- **Modern LaTeX**: Uses latest kernel features (`\NewDocumentCommand`, `\DeclareKeys`)
- **Modular Design**: Core class + 8 specialized style packages
- **PDF/A Compliance**: Optional PDF/A-2u support for archival requirements
- **Rich Math Support**: Comprehensive theorem environments and math typography
- **Elegant Typography**: Optional fancy typographic features
- **Debug Mode**: Work-in-progress mode with todos, draft watermarks, and line numbers
- **Flexible Layout**: Single/double-sided, configurable margins
- **Ready-to-use Templates**: Includes MFF CUNI (Charles University) frontmatter

## Quick Start

```latex
% IMPORTANT: PDF/A requires \DocumentMetadata before \documentclass
\DocumentMetadata{pdfstandard=A-2u}  % Optional: for PDF/A compliance

\documentclass[FANCY]{textured}

% Configure document metadata
\SetKeys[textured]{
  title       = {My Thesis Title},
  author      = {Your Name},
  supervisor  = {Prof. Advisor Name},
  date        = {January 2025},
  department  = {Department of Computer Science},
  university  = {Charles University},
  ThesisType  = master,  % bachelor, master, or doctoral
}

% Optional: Use bibliography for citing TeXtured
\addbibresource{textured.bib}
\addbibresource{mybibliography.bib}

\begin{document}

% Optional: Use included MFF CUNI frontmatter templates
\include{textured/frontmatter/title}
\include{textured/frontmatter/declaration}

\chapter{Introduction}
Your content here.

\references  % Bibliography section

\end{document}
```

## Class Options

| Option | Description |
|--------|-------------|
| `FANCY` / `noFANCY` | Enable/disable fancy typography (default: off) |
| `WIP` / `FINAL` | Work-in-progress mode with todos and watermarks (default: off) |
| `LINKBOXES` / `noLINKBOXES` | Colored boxes around links (default: off, disable for faster compilation) |
| `EXTRAMARGIN` | Extra right margin for notes (only with WIP mode) |
| `CENSOR` / `noCENSOR` | Censor designated passages (default: off) |
| `draft` | Draft mode (passed to base class) |

## Document Metadata

Configure via `\SetKeys[textured]{...}`:

**Required:**
- `title` – Document title
- `author` – Author name
- `date` – Date (free format)

**Optional:**
- `subtitle` – Document subtitle
- `supervisor` – Thesis supervisor name
- `department` – Academic department
- `university` – University name
- `ThesisType` – Type: `bachelor`, `master`, or `doctoral`
- `keywords` – Comma-separated keywords for PDF metadata
- `subject` – PDF subject metadata

See `examples/thesis-full.tex` for complete usage example.

## Included Components

### Frontmatter Templates
Located in `textured/frontmatter/`, ready to use:
- `title.tex` – Title page (MFF CUNI style)
- `declaration.tex` – Declaration of authorship
- `dedication.tex` – Dedication page
- `information.tex` – Thesis information page

Usage: `\include{textured/frontmatter/title}` or customize as needed.

### Bibliography
The package includes `textured.bib` containing a BibTeX entry for citing TeXtured:

```latex
\addbibresource{textured.bib}  % Automatically findable after CTAN installation
% ...
\autocite{textured}
```

Entry key: `textured`

### Style Packages
The class automatically loads these supporting packages:
- `textured-debug.sty` – Debug tools, line numbers, silence warnings
- `textured-general.sty` – Colors, typography, floats, hyperlinks
- `textured-misc.sty` – User macros, TikZ, Inkscape integration
- `textured-layout.sty` – Page geometry, headers, titles, TOC
- `textured-biblatex.sty` – Bibliography configuration (biblatex + biber)
- `textured-math.sty` – Math packages, fonts, macros, spacing
- `textured-envs.sty` – Theorem/remark/todo environments
- `textured-hacks.sty` – Package overrides and workarounds

## Requirements

- **TeX Live 2025+** (required for `keytheorems` package and modern LaTeX kernel)
- **Compiler**: pdfLaTeX or LuaLaTeX
- **Bibliography backend**: biber
- **Optional**: Inkscape (for SVG to PDF conversion)

## Compilation

### Standard build
```bash
latexmk thesis.tex
```

### Clean build artifacts
```bash
latexmk -C          # Clean all auxiliary files
```

### Selective compilation
Use `\includeonlysmart{chapters/Introduction, chapters/Design}` in your document to compile only specific chapters.

## Environments

### Theorem-like
- `theorem`, `proposition`, `lemma`, `corollary`
- Numbered, with optional titles

### Remark-like
- `remark`, `note`, `example`, `exercise`, `notation`, `terminology`, `definition`, `fact`
- Various numbering schemes

### Todo-like (WIP mode only)
- `todo`, `unsure`, `rewrite`, `polish`, `problem`, `missing`, `answer`, `idea`, `outline`
- Visible only when WIP option is enabled

See the user manual for complete environment documentation.

## Examples

Complete examples in the repository:
- `examples/minimal.tex` – Minimal working example
- `examples/thesis-full.tex` – Full-featured thesis example

## PDF/A Compliance

For archival-quality PDF/A-2u output:

1. Use `\DocumentMetadata{pdfstandard=A-2u}` **before** `\documentclass`
2. Ensure all fonts are embedded (handled automatically)
3. Validate with VeraPDF: https://verapdf.org/

**Note**: `\DocumentMetadata` is a LaTeX requirement, not specific to TeXtured.

## License

This work is subject to the LaTeX Project Public License, version 1.3c or later.  
See LICENSE-textured or https://www.latex-project.org/lppl.txt

Copyright 2024-2025 Jonas Dujava

## Repository

**GitHub**: https://github.com/jdujava/TeXtured  
**CTAN**: https://ctan.org/pkg/textured (after publication)

## Support

- **Issues**: https://github.com/jdujava/TeXtured/issues
- **Email**: jonas.dujava@matfyz.cuni.cz
- **CTAN**: ctan@ctan.org (for package-specific issues)

## Version

Current version: v1.5.0 (2025-08-06)

See CHANGELOG.md for version history.
