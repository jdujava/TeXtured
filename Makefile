.PHONY: all fmt pdf rebuild clean clean-all

all: prec.fmt thesis.pdf
fmt: prec.fmt
pdf: thesis.pdf

## see https://tony-zorman.com/posts/speeding-up-latex.html
prec.fmt: prec.tex preamble/*
	pdflatex -ini -file-line-error -jobname="prec" "&pdflatex prec.tex\dump"

thesis.pdf: prec.fmt thesis.tex figures frontmatter chapters
	latexmk thesis

rebuild: prec.fmt
	latexmk -g thesis

clean:
	latexmk -C

clean-all:
	latexmk -C
	rm -rf .aux/
