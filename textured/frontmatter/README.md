# TeXtured Frontmatter Templates

This directory contains ready-to-use frontmatter templates designed for
theses at the Faculty of Mathematics and Physics, Charles University (MFF CUNI).

## Files

- `title.tex` - Title page with university branding
- `declaration.tex` - Declaration of authorship
- `dedication.tex` - Optional dedication page
- `information.tex` - Thesis metadata (abstract, keywords, etc.)
- `img/MFF-logo.pdf` - Official MFF CUNI logo

## Logo Attribution

**The MFF CUNI logo (`MFF-logo.pdf`) is property of the Faculty of Mathematics and Physics, Charles University.**  
See [MFF Visual Identity](https://www.mff.cuni.cz/en/faculty/visual-identity) for official usage guidelines.

## Usage

In your main document, include these files:

```latex
\frontmatter
\include{frontmatter/title}        % or use full path if needed
\include{frontmatter/declaration}
\include{frontmatter/dedication}
\include{frontmatter/information}
```

## Customization

These templates can be:
- Used as-is for MFF CUNI theses
- Copied to your project and customized
- Replaced entirely with your own frontmatter

The templates use metadata set via `\SetKeys[textured]{...}` in your main document.

## License

These template files are provided as examples and may be freely adapted for any use.
