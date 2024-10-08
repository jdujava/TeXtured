## Choose TeX engine for PDF generation
$pdf_mode = 1; # use pdfTeX
# $pdf_mode = 4; # use LuaTeX

## Add `--shell-escape` flag to enable calling external programs (e.g. Inkscape)
# $pdflatex = 'pdflatex --shell-escape %O %S';
# $lualatex = 'lualatex --shell-escape %O %S';

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
