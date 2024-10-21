## This file contains instructions and configurations for the `latexmk` program

## Choose TeX engine for PDF generation
$pdf_mode = 1; # use pdfTeX
# $pdf_mode = 4; # use LuaTeX

### Additional flags for the TeX engine
## --shell-escape: enable external/system commands (e.g. Inkscape)
## --file-line-error: writes out the concrete file line in which the error occurred
## --halt-on-error: stop processing at the first error
## %O and %S will forward Options and the Source file, respectively, given to latexmk.
set_tex_cmds("--shell-escape --file-line-error --halt-on-error %O %S");

## Change default `biber` call to help catch errors faster/clearer. See
## https://www.semipol.de/posts/2018/06/latex-best-practices-lessons-learned-from-writing-a-phd-thesis/
$biber = "biber --validate-datamodel %O %S";

## Show used CPU time. Looks like: https://tex.stackexchange.com/a/312224/120853
$show_time = 1;

## Extra extensions of files to remove in a clean-up (`latexmk -c`)
$clean_ext = 'synctex.gz synctex.gz(busy)';
## Delete .bbl file in a clean-up if the bibliography file exists
$bibtex_use = 1.5;

## Write all auxiliary files in a separate directory
$aux_dir = '.aux';

## The aux directory structure has to match the source directory structure
## in order to compile the `tex` files without problems, since pdfLaTeX
## does not create the directories on its own.
## https://tex.stackexchange.com/questions/323820/i-cant-write-on-file-foo-aux
## NOTE: the following handles only one level of subdirectories
print `find . -maxdepth 2 -type f -name "*.tex" | # find all tex files up to 2 levels deep
    sed -nE 's|\\./(.*)/.*|\\1|p' | sort -u |     # extract directory names
    xargs -I {} mkdir -pv "$aux_dir"/{}           # create corresponding directories in aux_dir`;
