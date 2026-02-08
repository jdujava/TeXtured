%% TeXtured - A typographically elegant LaTeX document class for theses
%% 
%% Copyright 2024-2026 Jonas Dujava
%% 
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3c of this license or (at
%% your option) any later version. The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX version
%% 2008-05-04 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainer of this work is Jonas Dujava.
%% 
%% Please report all issues and feature requests on GitHub:
%%   https://github.com/jdujava/TeXtured

\NeedsTeXFormat{LaTeX2e}[2024-06-01]
\newcommand*{\TeXturedDate}{2026-02-08}
\newcommand*{\TeXturedVersion}{v2.0.0}
\newcommand*{\TeXturedDateVersion}{\TeXturedDate\space\TeXturedVersion}
\ProvidesClass{textured}[\TeXturedDateVersion\space TeXtured class]

\newcommand*{\TeXtured}{\texorpdfstring{\textsf{\TeX{}tured}}{TeXtured}}

% \RequirePackage{ifthen}
% \newboolean{...}

\DeclareKeys{
    draft.if    = @textured@draft,
    draft.usage = preamble,
    FANCY.if      = FANCY,
    noFANCY.ifnot = FANCY,
    WIP.if        = WIP,
    FINAL.ifnot   = WIP,
    EXTRAMARGIN.if = EXTRAMARGIN,
    LINKBOXES.if      = LINKBOXES,
    noLINKBOXES.ifnot = LINKBOXES,
    CENSOR.if      = CENSOR,
    noCENSOR.ifnot = CENSOR,
    twosided.if    = @textured@twosided,
    onesided.ifnot = @textured@twosided,
    showframe.code = {\PassOptionsToPackage{showframe}{geometry}},
}
\SetKeys{ % here we can set the defaults
    FANCY,     % by default, enable fancy decorations
    LINKBOXES, % by default, enable link/reference/citation boxes
}

\DeclareKeys{
    thesistype.store = \textured@thesisType,
    title.store = \textured@title,
    titleplaintext.store = \textured@titlePlaintext,
    titlefront.store = \textured@titleFront,
    author.store = \textured@author,
    authorplaintext.store = \textured@authorPlaintext,
    yearsubmitted.store = \textured@yearSubmitted,
    yearrevision.store = \textured@yearRevision,
    department.store = \textured@department,
    depttype.store = \textured@deptType,
    supervisor.store = \textured@supervisor,
    cosupervisor.store = \textured@coSupervisor,
    supervisorsdepartment.store = \textured@supervisorsDepartment,
    studyprogramme.store = \textured@studyProgramme,
    abstract.store = \textured@abstract,
    subject.store = \textured@subject,
    keywords.store = \textured@keywords,
    keywordsplaintext.store = \textured@keywordsPlaintext,
}
\SetKeys{
    thesistype={master},
    title={Title},
    titleplaintext=\textured@title,
    titlefront=\textured@title,
    author={Author},
    authorplaintext=\textured@author,
    yearsubmitted={\the\year},
    % yearrevision=\empty,
    department={Department/Institute},
    depttype={Department/Institute},
    supervisor={Supervisor},
    % cosupervisor=\empty,
    supervisorsdepartment={Supervisor's Department/Institute},
    studyprogramme={Study Programme},
    abstract={Abstract},
    subject={Subject},
    keywords={Keywords},
    keywordsplaintext=\textured@keywords,
}

\DeclareUnknownKeyHandler{%
    \PassOptionsToClass{\CurrentOption}{report}
}
\ProcessKeyOptions

%% add glyph-to-Unicode mappings for PDF/A compliance
\input{glyphtounicode}

\if@textured@twosided
    \PassOptionsToClass{openright,twoside}{report}
\fi
\LoadClass{report}

% \RequirePackage[...]{package-name}[<release-info>]

%% Preamble - data, packages, macros, and more
% \input{preamble/main}

\RequirePackage{textured-debug}
\RequirePackage{textured-general}
\RequirePackage{textured-misc}
\RequirePackage{textured-layout}
\RequirePackage{textured-biblatex}
\RequirePackage{textured-math}
\RequirePackage{textured-envs}
\RequirePackage{textured-hacks}

% \ClassError[textured]{<error-text>}{<help-text>}
% \ClassWarning[textured]{<warning-text>}
% \ClassNote[textured]{<note-text>}
% \ClassInfo[textured]{<info-text>}
%% can use \MessageBreak inside
