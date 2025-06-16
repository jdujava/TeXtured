\NeedsTeXFormat{LaTeX2e}[2024-06-01]
\ProvidesClass{textured}[2025-05-24 v1.9 TeXtured class]

% \RequirePackage{ifthen}
% \newboolean{...}

\DeclareKeys{
    draft.if    = @textured@draft,
    draft.usage = preamble,
    name.store  = \@textured@name,
    name.usage  = load,
    % name.default = ..., % probably does not work by default without enabling `expl3`
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
    twosided.code = {\PassOptionsToClass{openright,twoside}{report}},
}

\DeclareUnknownKeyHandler{%
    \PassOptionsToClass{\CurrentOption}{report}
}

\SetKeys{ % here we can set the defaults
    FANCY,     % by default, enable fancy decorations
    LINKBOXES, % by default, enable link/reference/citation boxes
}
\ProcessKeyOptions

\LoadClass{report}

% \RequirePackage[...]{package-name}[<release-info>]

% \ClassError[textured]{<error-text>}{<help-text>}
% \ClassWarning[textured]{<warning-text>}
% \ClassNote[textured]{<note-text>}
% \ClassInfo[textured]{<info-text>}
%% can use \MessageBreak inside
