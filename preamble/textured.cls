\NeedsTeXFormat{LaTeX2e}[2024-06-01]
\ProvidesClass{textured}[2025-05-24 v1.9 TeXtured class]

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
\input{preamble/pdfA-compliance/glyphtounicode}

\if@textured@twosided
    \PassOptionsToClass{openright,twoside}{report}
\fi
\LoadClass{report}

% \RequirePackage[...]{package-name}[<release-info>]

%% Preamble - data, packages, macros, and more
\RequirePackage{textured-debug}
\input{preamble/main}
\RequirePackage{textured-layout}
\RequirePackage{textured-envs}

% \ClassError[textured]{<error-text>}{<help-text>}
% \ClassWarning[textured]{<warning-text>}
% \ClassNote[textured]{<note-text>}
% \ClassInfo[textured]{<info-text>}
%% can use \MessageBreak inside
