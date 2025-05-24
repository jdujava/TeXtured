%% Maintained by Jonas Dujava, 2024-present
%% Please report all issues and feature requests on GitHub: https://github.com/jdujava/TeXtured
%% This work is marked CC0 1.0 (dedicated to the public domain)

\NeedsTeXFormat{LaTeX2e}[2024-06-01]
\newcommand*{\TeXturedDate}{2025-08-06}
\newcommand*{\TeXturedVersion}{v1.5.0}
\newcommand*{\TeXturedDateVersion}{\TeXturedDate\space\TeXturedVersion}
\ProvidesClass{textured}[\TeXturedDateVersion\space TeXtured class]

\newcommand*{\TeXtured}{\texorpdfstring{\textsf{\TeX{}tured}}{TeXtured}}

% \RequirePackage{ifthen}
% \newboolean{...}

\DeclareKeys{
    draft.if    = @textured@draft,
    draft.usage = preamble,
    name.store  = \@textured@name,
    name.usage  = load,
    name.default = ..., % probably does not work by default without enabling `expl3`
    random.code = ... % execute arbitary code
}

\DeclareUnknownKeyHandler{%
    \PassOptionsToClass{\CurrentOption}{report}
}

\SetKeys{ % here we can set the defaults
    ...
}
\ProcessKeyOptions

% \PassOptionsToClass{12pt,a4paper}{report}
\LoadClass[...]{report}


\RequirePackage[...]{package-name}[<release-info>]

% \ClassError[textured]{<error-text>}{<help-text>}
% \ClassWarning[textured]{<warning-text>}
% \ClassNote[textured]{<note-text>}
% \ClassInfo[textured]{<info-text>}
%% can use \MessageBreak inside
