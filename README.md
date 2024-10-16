<div align="center">
    <img alt="TeXtured Template" src="https://raw.githubusercontent.com/jdujava/TeXtured/refs/heads/master/figures/TeXtured-logo-light-mode.svg#gh-light-mode-only">
    <img alt="TeXtured Template" src="https://raw.githubusercontent.com/jdujava/TeXtured/refs/heads/master/figures/TeXtured-logo-dark-mode.svg#gh-dark-mode-only">
</div>

## 🚀 Elevator Pitch

Do you care in the slightest about what your readers think about your document,
and by proxy about you and your competence level? If yes, then a classy,
typographically professional layout and structured, clear, and revealing content
can only help. This template tries to aid you in both of these endeavors.

Here’s what the **TeXtured** Template offers:
- ✨ **typographically elegant layout** with various features to make your document stand out
- 🧙 **clean code structure** with plenty of comments to help you easily customize the template to your needs
- 🔗 **seamless GitHub integration** (via GitHub Actions) to streamline version control and collaboration
- 📄 **PDF/A compliance** and *front matter* supporting theses at [MFF](https://www.mff.cuni.cz/en) 🎓

To learn more about the design principles behind `TeXtured` and its capabilities, look
at the [TeXtured Demo](https://jdujava.github.io/TeXtured/thesis.pdf) 📖.
It showcases the features of `TeXtured` template and provides a guide on how to use them.

> [!NOTE]
> Please note that the documentation is still a work-in-progress 🚧,
> with more guides and explanations to come.

> [!TIP]
> If you find something interesting or useful, but adopting the whole template
> is simply too much, feel free to just copy and use relevant parts of the code.
> (🚧 TODO: link relevant files for corresponding features in DEMO file)

## 🏗️ Building

Be sure to have all the dependencies installed (at least the LaTeX build tools), and run
```sh
latexmk thesis
```
in the root directory of the repository to build the thesis.

> [!TIP]
> If you prefer to use 🍃`Overleaf`, you can find the `TeXtured`
> [template](https://www.overleaf.com/latex/templates/textured/zwtzzwgddbsh) there as well.

## 📦 Software Dependencies

LaTeX build tools:
- `latexmk` - LaTeX build tool
- `pdflatex`/`lualatex` - LaTeX engine (you can choose one in `.latexmkrc`)
- `biber` - bibliography processing tool for `biblatex`

> [!WARNING]
> At this point it is unclear what is the minimal required LaTeX installation.
> Full `TeX Live` distribution is surely enough, since it is used in GitHub Actions
> to automatically build the latest version of the [TeXtured Demo](https://jdujava.github.io/TeXtured/thesis.pdf) 📖.

> [!NOTE]
> Some scripts assume `linux` environment. These include:
> - generation of directory structure for `aux_dir` (dependencies are `sed`, `xargs`)
> - vector figure generation (together with watermark)
>     + need to enable `--shell-escape` in `.latexmkrc`
>     + `inkscape` - vector graphics (and SVG to PDF conversion)
>     + `perl` - disabling `/Interpolation` in PDFs generated by `inkscape`
>     + `sed` - substituting placeholders in PDF watermark
>     + `ghostscript` - injecting `postscript` watermark into PDF

Version control (optional):
- `git` - (obviously) the preferred version control system
- `git-lfs` - [Git Large File Storage](https://git-lfs.github.com/) - for storing PDFs, figures, etc.


## 📜 License

Exceptions:
- The MFF CUNI logo `MFF-logo.pdf` is property of the corresponding faculty, see [MFF Visual Identity](https://www.mff.cuni.cz/en/faculty/visual-identity).
- Figure `parallel-plate-capacitor.svg` (with corresponding files) is property of Jonáš Dujava.

[<img align="center" alt="License: CC0-1.0" src="https://licensebuttons.net/p/zero/1.0/88x31.png">](http://creativecommons.org/publicdomain/zero/1.0/)
All other files are marked with [CC0 1.0](http://creativecommons.org/publicdomain/zero/1.0/).

Even though you are free to use the source code of `TeXtured` any way you like, attribution/acknowledgement is welcome.
