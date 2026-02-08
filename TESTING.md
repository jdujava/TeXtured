# Local Installation Testing Guide

This guide explains how to test the TeXtured class with a local installation using l3build, the standard LaTeX package development tool.

## Quick Test

```bash
# 1. Install locally (uses l3build - standard LaTeX Project tool)
l3build install

# 2. Test from this directory
pdflatex test-external.tex
biber test-external
pdflatex test-external.tex

# 3. Test from another directory (most important test!)
cd /tmp
cp ~/Documents/customfiles/TeXtured/test-external.tex .
pdflatex test-external.tex
biber test-external
pdflatex test-external.tex
# Should work perfectly - class found via kpathsea!

# 4. Uninstall when done
cd ~/Documents/customfiles/TeXtured
l3build uninstall
```

## Installation with l3build

**l3build** is the official LaTeX Project tool for package development, used by the LaTeX kernel itself and most modern packages.

### Commands

```bash
l3build install      # Install to TEXMFHOME
l3build uninstall    # Remove from TEXMFHOME
l3build ctan         # Create CTAN package (advanced)
l3build clean        # Clean build artifacts
l3build help         # Show all commands
```

### What Gets Installed

When you run `l3build install`, the following TDS-compliant structure is created:

```
~/.local/share/texmf/  (or ~/texmf/ on some systems)
├── tex/latex/textured/
│   ├── textured.cls
│   ├── textured-*.sty (8 files)
│   ├── glyphtounicode.tex
│   └── frontmatter/
│       ├── title.tex
│       ├── declaration.tex
│       ├── dedication.tex
│       ├── information.tex
│       ├── README.md
│       └── img/MFF-logo.pdf
├── bibtex/bib/textured/
│   └── textured.bib
└── doc/latex/textured/  (optional)
    ├── README.md
    ├── CHANGELOG.md
    └── LICENSE
```

## How It Works

1. **Class Loading**: `\documentclass{textured}` works from any directory
   - TeX uses kpathsea to search TEXMFHOME/tex/latex/
   - Finds textured.cls automatically

2. **Style Files**: Automatically found
   - All `textured-*.sty` are in same directory as class
   - Loaded via `\RequirePackage{textured-name}`

3. **Bibliography**: Auto-loaded by class
   - `textured.bib` found via BIBINPUTS search
   - Biber locates it in TEXMFHOME/bibtex/bib/
   - No user action needed

4. **Frontmatter Templates**: Accessible via path
   - Use: `\include{textured/frontmatter/title}`
   - TeX finds it in tex/latex/textured/frontmatter/

5. **Verification**: Use `kpsewhich` to verify
   ```bash
   kpsewhich textured.cls       # Should show path in ~/.local/share/texmf/
   kpsewhich textured.bib       # Should show path in ~/.local/share/texmf/
   kpsewhich textured-math.sty  # Should show path in ~/.local/share/texmf/
   ```

## Testing Checklist

- [ ] Run `./install-local.sh` without errors
- [ ] **Test 1: Basic compilation** - Compile `test-external.tex` in repository directory
- [ ] **Test 2: External directory** - Copy `test-external.tex` to `/tmp` and compile there
- [ ] **Test 3: Frontmatter templates** - Compile `test-frontmatter.tex` to verify template access
- [ ] Verify PDFs contain:
  - [ ] Title page with class formatting
  - [ ] Theorem environment styled correctly
  - [ ] Bibliography reference to TeXtured
  - [ ] References section at end
  - [ ] (test-frontmatter) Declaration and dedication pages
- [ ] Test with pdfLaTeX: `pdflatex test-external.tex`
- [ ] Test with LuaLaTeX: `lualatex test-external.tex`
- [ ] Run `./uninstall-local.sh` and verify class no longer found

## Common Issues

**Class not found after installation:**
- Run `texhash ~/texmf` to update the filename database
- Check that files are in `~/texmf/tex/latex/textured/` not `~/texmf/textured/`

**Bibliography not found:**
- Ensure `textured.bib` is in `~/texmf/bibtex/bib/textured/`
- Run `texhash ~/texmf`

**Frontmatter templates not found:**
- Check that `frontmatter/` directory was copied to `~/texmf/tex/latex/textured/frontmatter/`
- Use path `textured/frontmatter/title.tex` in your document

## After Testing

When testing is complete:
```bash
./uninstall-local.sh
```

This removes all installed files and updates the TeX database.

## Notes

- The installation scripts only affect your local `~/texmf/` directory
- No system-wide changes are made
- Safe to run multiple times (overwrites existing installation)
- Compatible with both TeX Live and MiKTeX on Linux/macOS/Windows
