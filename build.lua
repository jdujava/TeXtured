#!/usr/bin/env texlua

--[[
================================================================================
  TeXtured LaTeX Class - l3build Configuration
================================================================================

  This configuration file manages building, testing, installation, and CTAN
  packaging for the TeXtured document class using l3build (the official LaTeX
  Project build tool).

  Key Features:
  - TDS-compliant installation to TEXMFHOME
  - Automated testing with latexmk (proper bibliography handling)
  - CTAN package creation with correct structure
  - Custom install/uninstall for subdirectory support

  Available Commands:
  - l3build install       Install to local TEXMFHOME
  - l3build uninstall     Remove from TEXMFHOME
  - l3build check         Run automated tests
  - l3build ctan          Create CTAN package
  - l3build clean         Remove build artifacts

  Note: Custom functions are used because l3build doesn't natively support:
  1. Recursive subdirectory installation (frontmatter/)
  2. latexmk integration for biber/bibliography processing
  3. Complex TDS structures with multiple target directories

================================================================================
]]--

--------------------------------------------------------------------------------
-- Package Metadata
--------------------------------------------------------------------------------

module = "textured"
version = "2.0.0"
date = "2026-02-08"

--------------------------------------------------------------------------------
-- Directory Structure
--------------------------------------------------------------------------------

sourcefiledir = "textured"  -- Source files (distributable class files)
docfiledir = "."            -- Documentation root
maindir = "."               -- Main project directory
testfiledir = "testfiles"   -- Automated test files (.lvt)

--------------------------------------------------------------------------------
-- Test Configuration
--------------------------------------------------------------------------------

checkengines = {"pdftex"}  -- Test with pdflatex (standard for most users)
stdengine = "pdftex"

-- Note: We override the test execution to use latexmk (see runtest_tasks below)
checkruns = 3  -- Default runs (overridden by latexmk)
checksuppressfiles = {"*.pdf", "*.nav", "*.snm", "*.vrb"}  -- Don't include in .tlg

--[[
  Hook: checkinit_hook()
  
  Runs before test execution begins. Copies .latexmkrc from test/ directory
  to the build/test/ directory so tests compile with proper configuration
  (including biber for bibliographies).
  
  Why needed: l3build's test directory is isolated and needs compilation config.
]]--
function checkinit_hook()
  local latexmkrc = "test/.latexmkrc"
  if fileexists(latexmkrc) then
    cp(latexmkrc, testdir, ".latexmkrc")
  end
  return 0
end

--[[
  Function: runtest_tasks(name, run)
  
  Overrides l3build's default test execution to use latexmk instead of
  running pdflatex multiple times manually.
  
  Why latexmk:
  - Automatically runs biber when needed (bibliography processing)
  - Handles multiple compilation passes intelligently
  - Detects changes and reruns only when necessary
  - Matches real-world thesis compilation workflow
  
  Without this: Tests would compile but bibliographies wouldn't be processed,
  resulting in incomplete PDFs with missing references.
  
  Parameters:
    name - Base name of the test file (without .lvt extension)
    run  - Run number (1, 2, 3...)
  
  Returns:
    String - Shell command to execute
    ""     - Skip this run
]]--
function runtest_tasks(name, run)
  if run == 1 then
    -- First run: Use latexmk which handles everything automatically
    return "latexmk -pdf -interaction=nonstopmode " .. name .. ".lvt"
  end
  -- Skip additional runs - latexmk already did all necessary passes
  return ""
end

--------------------------------------------------------------------------------
-- TDS Installation Structure
--------------------------------------------------------------------------------

--[[
  TDS (TeX Directory Structure) Locations
  
  This specifies where files should be installed in the texmf tree.
  Standard structure:
  
  TEXMFHOME/
  ├── tex/latex/textured/          Runtime files (.cls, .sty, .tex)
  │   └── frontmatter/             Bundled templates
  │       ├── *.tex                Template files
  │       └── img/                 Images (MFF logo)
  ├── bibtex/bib/textured/         Bibliography files (.bib)
  ├── doc/latex/textured/          Documentation (README, examples)
  │   └── examples/                Example documents
  └── source/latex/textured/       Source files (thesis.tex for reference)
  
  Note: This uses glob patterns for files. Subdirectories are handled by
  custom install_files() function below since l3build doesn't recurse.
]]--
tdslocations = {
  "tex/latex/textured/*.cls",
  "tex/latex/textured/*.sty", 
  "tex/latex/textured/*.tex",
  "tex/latex/textured/frontmatter/*.tex",
  "tex/latex/textured/frontmatter/img/*.pdf",
  "bibtex/bib/textured/*.bib",
  "doc/latex/textured/README.md",
  "doc/latex/textured/CHANGELOG.md",
  "doc/latex/textured/LICENSE-textured",
  "doc/latex/textured/textured.pdf",
  "doc/latex/textured/examples/*.tex",
  "doc/latex/textured/examples/chapters/*.tex",
  "doc/latex/textured/examples/.latexmkrc",
  "source/latex/textured/thesis.tex"
}

--------------------------------------------------------------------------------
-- File Selection for Installation and Distribution
--------------------------------------------------------------------------------

-- Runtime files installed to tex/latex/textured/
installfiles = {
  "*.cls",
  "*.sty",
  "glyphtounicode.tex"
}

-- Note: frontmatter/ subdirectory handled by custom install_files() function

-- Documentation typesetting
-- thesis.tex is the main manual demonstrating all features
typesetfiles = {"thesis.tex"}

-- Support files for documentation (used during doc build)
-- thesis.tex needs examples/chapters/ and preamble/user/ files
supportfiles = {
  "examples/chapters/*.tex"
}

-- Hook to copy preamble directory structure for documentation build
function docinit_hook()
  -- Copy preamble/user/ directory to build/doc/
  local docdir = typesetdir or "build/doc"
  mkdir(docdir .. "/preamble")
  mkdir(docdir .. "/preamble/user")
  cp("*.tex", "preamble/user", docdir .. "/preamble/user")
  
  -- Create directories for .aux files
  mkdir(docdir .. "/textured")
  mkdir(docdir .. "/textured/frontmatter")
  mkdir(docdir .. "/examples")
  mkdir(docdir .. "/examples/chapters")
  
  return 0
end

-- Source files to include in CTAN distribution
sourcefiles = {
  "*.cls",
  "*.sty", 
  "*.tex",
  "*.bib",
  "*.md",
  "LICENSE-textured",
  "frontmatter/*.tex",
  "frontmatter/*.md",
  "frontmatter/img/*.pdf"
}

-- Files to include in CTAN package
ctanfiles = {
  "README.md",
  "CHANGELOG.md",
  "LICENSE-textured",
  "*.cls",
  "*.sty",
  "*.tex",
  "*.bib",
  "frontmatter/README.md",
  "frontmatter/*.tex",
  "frontmatter/img/*.pdf"
}

-- Files to exclude from all operations
excludefiles = {
  "**/.*",           -- Hidden files
  "**/.aux/**",      -- Aux directories
  "*.log",
  "*.aux",
  "*.synctex.gz",
  "*.fls",
  "*.fdb_latexmk",
  "*.out",
  "*.toc",
  "*.bbl",
  "*.blg",
  "*.bcf",
  "*.run.xml"
}

--------------------------------------------------------------------------------
-- CTAN Package Configuration
--------------------------------------------------------------------------------

ctanpkg = module
ctanzip = ctanpkg .. "-" .. version

-- Metadata for CTAN upload
uploadconfig = {
  pkg = module,
  version = version,
  author = "Jonas Dujava",
  license = "lppl1.3c",
  summary = "Professional LaTeX thesis class with elegant typography",
  ctanPath = "/macros/latex/contrib/" .. module,
  repository = "https://github.com/jdujava/TeXtured",
  bugtracker = "https://github.com/jdujava/TeXtured/issues",
  description = "TeXtured is a professionally typeset LaTeX document class for academic theses, featuring PDF/A compliance, modular architecture, extensive math support, and ready-to-use frontmatter templates.",
  topic = {"class", "thesis", "dissertation", "academic-writing"},
  announcement_file = "CHANGELOG.md"
}

--------------------------------------------------------------------------------
-- Custom Installation Functions
--------------------------------------------------------------------------------

--[[
  Function: install_files()
  
  Custom installation function that properly handles subdirectories.
  
  Why custom function needed:
  l3build's default install mechanism uses tdslocations with glob patterns,
  which doesn't properly handle:
  1. Creating nested directory structures (frontmatter/img/)
  2. Copying entire subdirectories recursively
  3. Multiple target directories (tex/, bibtex/, doc/)
  
  This function:
  - Detects TEXMFHOME automatically (cross-platform)
  - Creates all necessary directories
  - Copies files to correct TDS locations
  - Handles frontmatter/ subdirectory structure
  - Provides verification commands
  
  Installation structure matches kpathsea search paths so files are
  automatically found without running texhash (on modern TeX distributions).
]]--
local function install_files()
  local texmfhome = kpse.var_value("TEXMFHOME")
  local target = texmfhome .. "/"
  
  print("Installing to: " .. texmfhome)
  
  -- Runtime files to tex/latex/textured/
  local texdir = target .. "tex/latex/" .. module .. "/"
  print("- Creating " .. texdir)
  mkdir(texdir)
  
  -- Copy main class and style files
  for _, pattern in ipairs({"*.cls", "*.sty", "glyphtounicode.tex"}) do
    cp(pattern, sourcefiledir, texdir)
  end
  
  -- Copy frontmatter templates recursively
  -- These are bundled with the class so users can \include{textured/frontmatter/title}
  local frontdir = texdir .. "frontmatter/"
  print("- Copying frontmatter templates")
  mkdir(frontdir)
  cp("*.tex", sourcefiledir .. "/frontmatter", frontdir)
  cp("*.md", sourcefiledir .. "/frontmatter", frontdir)
  mkdir(frontdir .. "img/")
  cp("*.pdf", sourcefiledir .. "/frontmatter/img", frontdir .. "img/")
  
  -- Bibliography files to bibtex/bib/textured/
  -- Biber searches BIBINPUTS which includes this path automatically
  local bibdir = target .. "bibtex/bib/" .. module .. "/"
  print("- Creating " .. bibdir)
  mkdir(bibdir)
  cp("*.bib", sourcefiledir, bibdir)
  
  -- Documentation to doc/latex/textured/ (optional but useful)
  local docdir = target .. "doc/latex/" .. module .. "/"
  print("- Creating " .. docdir)
  mkdir(docdir)
  cp("README.md", sourcefiledir, docdir)
  cp("CHANGELOG.md", sourcefiledir, docdir)
  cp("LICENSE-textured", sourcefiledir, docdir)
  
  print("Installation complete!")
  print("\nVerify with:")
  print("  kpsewhich textured.cls")
  print("  kpsewhich textured.bib")
  
  return 0
end

--[[
  Function: uninstall_files()
  
  Removes all installed files from TEXMFHOME.
  Companion to install_files() - removes everything that was installed.
]]--
local function uninstall_files()
  local texmfhome = kpse.var_value("TEXMFHOME")
  
  print("Uninstalling from: " .. texmfhome)
  
  -- Remove runtime files
  local texdir = texmfhome .. "/tex/latex/" .. module .. "/"
  if fileexists(texdir) then
    print("- Removing " .. texdir)
    rmdir(texdir)
  end
  
  -- Remove bibliography
  local bibdir = texmfhome .. "/bibtex/bib/" .. module .. "/"
  if fileexists(bibdir) then
    print("- Removing " .. bibdir)
    rmdir(bibdir)
  end
  
  -- Remove documentation
  local docdir = texmfhome .. "/doc/latex/" .. module .. "/"
  if fileexists(docdir) then
    print("- Removing " .. docdir)
    rmdir(docdir)
  end
  
  print("Uninstallation complete!")
  print("\nVerify with:")
  print("  kpsewhich textured.cls  (should return nothing)")
  
  return 0
end

--------------------------------------------------------------------------------
-- Target Registration
--------------------------------------------------------------------------------

--[[
  Override l3build's default install/uninstall targets with our custom functions.
  
  This is the standard l3build way to add custom targets. The target_list table
  maps command names to functions and descriptions.
]]--
if options and options["target"] == "install" then
  target_list["install"] = {func = install_files, desc = "Installs files into local texmf tree"}
elseif options and options["target"] == "uninstall" then
  target_list["uninstall"] = {func = uninstall_files, desc = "Uninstalls files from local texmf tree"}
end

--------------------------------------------------------------------------------
-- Cleanup Configuration
--------------------------------------------------------------------------------

-- Files to remove during l3build clean
cleanfiles = {".aux/**", "*.pdf"}

--------------------------------------------------------------------------------
-- Initialization Message
--------------------------------------------------------------------------------

-- Print version info when configuration loads
print("TeXtured v" .. version .. " (" .. date .. ")")
print("l3build configuration loaded")
