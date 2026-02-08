## latexmkrc for TeXtured test files
## Based on root .latexmkrc but adapted for test directory

## Choose TeX engine for PDF generation
$pdf_mode = 1; # use pdfTeX

### Additional flags for the TeX engine
## --shell-escape: enable external/system commands (e.g. Inkscape)
## --file-line-error: writes out the concrete file line in which the error occurred
## --halt-on-error: stop processing at the first error
## %O and %S will forward Options and the Source file, respectively, given to latexmk.
set_tex_cmds("--shell-escape --file-line-error --halt-on-error %O %S");

## Change default `biber` call to help catch errors faster/clearer
$biber = "biber --validate-datamodel %O %S";

## Show used CPU time
$show_time = 1;

## Extra extensions of files to remove in a clean-up (`latexmk -c`)
$clean_ext = 'synctex.gz synctex.gz(busy)';
## Delete .bbl file in a clean-up if the bibliography file exists
$bibtex_use = 1.5;

## Write all auxiliary files in a separate directory
$aux_dir = '.aux';

## Create aux directory structure for both local and installed class files
## This ensures LaTeX can write .aux files for \include{textured/frontmatter/...}
print `
    # Create base aux directory
    mkdir -p "$aux_dir"
    
    # Find local .tex files and create their directory structure
    find . -maxdepth 3 -type f -name "*.tex" |
        sed -nE 's|\\./(.*)/.*|\\1|p' | sort -u |
        xargs -I {} mkdir -pv "$aux_dir"/{}
    
    # Create directory for textured class frontmatter files
    mkdir -pv "$aux_dir"/textured/frontmatter
`;
