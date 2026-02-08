## Configuration for latexmk in the examples directory
## This allows easy compilation with: latexmk minimal.tex

## Add parent textured/ directory to search paths
ensure_path('TEXINPUTS', '../textured//');
ensure_path('BIBINPUTS', '../textured//');

## Choose TeX engine for PDF generation
$pdf_mode = 1; # use pdfTeX
# $pdf_mode = 4; # use LuaTeX

### Additional flags for the TeX engine
## --shell-escape: enable external/system commands (e.g. Inkscape for SVG conversion)
## --file-line-error: writes out the concrete file line in which the error occurred
## --synctex=1: enable SyncTeX for editor integration
set_tex_cmds("--shell-escape --file-line-error --synctex=1 %O %S");

## Use biber for bibliography processing with validation
$biber = "biber --validate-datamodel %O %S";

## Show used CPU time
$show_time = 1;

## Extra extensions of files to remove in a clean-up (`latexmk -c`)
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml';

## Delete .bbl file in a clean-up if the bibliography file exists
$bibtex_use = 1.5;

## Write all auxiliary files in a separate directory
$aux_dir = '.aux';

## The aux directory structure has to match the source directory structure
## in order to compile the `tex` files without problems, since pdfLaTeX
## does not create the directories on its own.
## https://tex.stackexchange.com/questions/323820/i-cant-write-on-file-foo-aux
## NOTE: the following handles up to 2 levels of subdirectories
print `find . -maxdepth 2 -type f -name "*.tex" | # find all tex files up to 2 levels deep
    sed -nE 's|\\./(.*)/.*|\\1|p' | sort -u |     # extract directory names
    xargs -I {} mkdir -pv "$aux_dir"/{}           # create corresponding directories in aux_dir`;
