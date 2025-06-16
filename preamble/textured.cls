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
    random.code = {...}, % execute arbitary code
    FANCY.if    = FANCY,
    noFANCY.ifnot = FANCY,
    WIP.if      = WIP,
    FINAL.ifnot = WIP,
    EXTRAMARGIN.if = EXTRAMARGIN,
    LINKBOXES.if = LINKBOXES,
    noLINKBOXES.ifnot = LINKBOXES,
    CENSOR.if   = CENSOR,
    noCENSOR.ifnot = CENSOR,
    twosided.if    = @textured@twosided,
    onesided.ifnot = @textured@twosided,
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
\newcommand*{\fillthisin}[1]{\textcolor{red}{#1}} % placeholder for required fields
\SetKeys{
    thesistype={master},
    title={\TeXtured{} Manual},
    titleplaintext={TeXtured Manual \TeXturedVERSION},
    titlefront={\ThesisTitle \\{\Huge\color{gray}\TeXturedVERSION}},
    author={\fillthisin{Author's Name}},
    authorplaintext={Author's Name},
    yearsubmitted={\year},
    department={\fillthisin{Name of the Department/Institute}},
    depttype={Institute}, % Department (katedra), or an Institute (ústav)
    supervisor={\fillthisin{Prof.~Name Surname}},
    supervisorsdepartment={\fillthisin{Supervisor's Department/Institute}},
    studyprogramme={\fillthisin{Study Programme}},
    abstract={\fillthisin{Write abstract here.}},
    subject={\fillthisin{Write subject here.}},
    keywords={\fillthisin{Manual, Demo, Draft, WIP}},
    keywordsplaintext={Manual, Demo, Draft, WIP},
}

\DeclareUnknownKeyHandler{%
    \PassOptionsToClass{\CurrentOption}{report}
}
\ProcessKeyOptions

\if@textured@twosided
    \PassOptionsToClass{openright,twoside}{report}
\fi
\LoadClass{report}

% \RequirePackage[...]{package-name}[<release-info>]

%% Preamble - data, packages, macros, and more
\input{preamble/main}

% \ClassError[textured]{<error-text>}{<help-text>}
% \ClassWarning[textured]{<warning-text>}
% \ClassNote[textured]{<note-text>}
% \ClassInfo[textured]{<info-text>}
%% can use \MessageBreak inside
