# Changelog

All notable changes to TeXtured will be documented in this file.

## v2.0.0 (2026-02-08) - First CTAN Release

### Added
- **First official CTAN release** 🎉
- l3build infrastructure for modern package management
- Automated test suite with 4 comprehensive tests (basic, bibliography, options, frontmatter)
- `l3build install` command for easy local installation
- `l3build check` command for automated testing
- `l3build ctan` command for CTAN package creation
- Comprehensive 28-page PDF manual (textured.pdf) demonstrating all features
- TDS-compliant installation structure
- Auto-loading of bundled bibliography (textured.bib)
- Bundled frontmatter templates accessible via textured/frontmatter/ prefix

### Changed
- Version bumped to 2.0.0 to mark CTAN milestone
- Simplified installation workflow (no manual scripts needed)
- Reorganized into textured/ (distributable) and examples/ (demonstration)
- Improved build system replacing bash scripts
- Updated documentation for CTAN standards

### Fixed
- Bibliography auto-loading via biber
- Frontmatter template paths for installed class
- PDF/A compliance configuration
- Cross-platform installation (TEXMFHOME detection)

### Technical
- build.lua: 400+ lines of l3build configuration
- Custom install/uninstall functions for subdirectory handling
- latexmk integration for proper bibliography processing
- Test coverage for real-world thesis scenarios

---

## v1.5.0 (2025-08-06) - CTAN Preparation Release

### Added
- Complete modular restructure: split into `textured.cls` + 8 supporting `.sty` files
- Modern key-value option system using `\DeclareKeys`
- Metadata configuration via `\SetKeys[textured]{...}`
- LPPL 1.3c license headers on all class and style files
- Included frontmatter templates for MFF CUNI thesis requirements
- Included bibliography file for citing TeXtured
- Comprehensive README.md with quick start guide
- Examples directory with demonstration files

### Changed
- **BREAKING**: Moved from template structure to proper LaTeX class
- **BREAKING**: Option syntax changed to key-value format
- **BREAKING**: Internal commands now use `\textured@` namespace
- Reorganized file structure for CTAN distribution
- PDF/A compliance files moved to textured/ directory
- Documentation separated into class docs and examples

### Fixed
- Improved package loading order for better compatibility
- Resolved namespace conflicts with modern packages

### Documentation
- Added comprehensive user documentation
- Created minimal working example
- Documented all class options and commands
- Added installation and compilation instructions

## Previous Versions (Template Era)

Versions prior to 1.5.0 were distributed as a LaTeX template rather than a document class. Users had to download and modify the entire repository structure.

For historical context, see the git history at:  
https://github.com/jdujava/TeXtured/commits/master

### Notable Template Features (pre-v1.5.0)
- Toggle-based configuration system
- Preamble-based structure
- MFF CUNI-specific frontmatter
- PDF/A-2u compliance support
- Work-in-progress mode with todos
- Extensive math support and theorem environments
- Inkscape SVG integration
- RAM disk compilation script

---

## Version Numbering

TeXtured follows semantic versioning (MAJOR.MINOR.PATCH):
- MAJOR: Incompatible API changes
- MINOR: New features, backward-compatible
- PATCH: Bug fixes, backward-compatible

Version 1.5.0 marks the transition from template to class, representing a major milestone in the project's evolution.
