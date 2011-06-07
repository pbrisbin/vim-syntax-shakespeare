" Vim syntax file
" Language: Cassius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is
"
" This is basically css.vim, but with most values not contained (braces 
" aren't needed in cassius) and a few features removed.
"
"""

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'cassius'
endif

syn case ignore

syn keyword csTagName abbr acronym address applet area a b base
syn keyword csTagName basefont bdo big blockquote body br button
syn keyword csTagName caption center cite code col colgroup dd del
syn keyword csTagName dfn dir div dl dt em fieldset form frame
syn keyword csTagName frameset h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword csTagName iframe img input ins isindex kbd label legend li
syn keyword csTagName link map menu meta noframes noscript ol optgroup
syn keyword csTagName option p param pre q s samp script select small
syn keyword csTagName span strike strong style sub sup tbody td
syn keyword csTagName textarea tfoot th thead title tr tt ul u var

" html5 tags, as per http://www.w3schools.com/html5/html5_reference.asp
syn keyword csTagName article aside audio canvas command datalist details
syn keyword csTagName embed figcaption figure footer header hgroup keygen
syn keyword csTagName mark meter nav output progress rp rt ruby section
syn keyword csTagName source summary time video wbr

try
syn match csIdentifier "#[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
catch /^.*/
syn match csIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
endtry

syn match csValueInteger "[-+]\=\d\+"
syn match csValueNumber "[-+]\=\d\+\(\.\d*\)\="
syn match csValueLength "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\)"
syn match csValueAngle "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\)"
syn match csValueTime "+\=\d\+\(\.\d*\)\=\(ms\|s\)"
syn match csValueFrequency "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)"

syn match csUnicodeRange "U+[0-9A-Fa-f?]\+"
syn match csUnicodeRange "U+\x\+-\x\+"

syn keyword csColor aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal yellow
" FIXME: These are actually case-insentivie too, but (a) specs recommend using
" mixed-case (b) it's hard to highlight the word `Background' correctly in
" all situations
syn case match
syn keyword csColor ActiveBorder ActiveCaption AppWorkspace ButtonFace ButtonHighlight ButtonShadow ButtonText CaptionText GrayText Highlight HighlightText InactiveBorder InactiveCaption InactiveCaptionText InfoBackground InfoText Menu MenuText Scrollbar ThreeDDarkShadow ThreeDFace ThreeDHighlight ThreeDLightShadow ThreeDShadow Window WindowFrame WindowText Background
syn case ignore

syn match csColor "\<transparent\>"
syn match csColor "\<white\>"
syn match csColor "#[0-9A-Fa-f]\{3\}\>"
syn match csColor "#[0-9A-Fa-f]\{6\}\>"
syn region csFunction matchgroup=csFunctionName start="\<\(rgb\|clip\|attr\|counter\|rect\)\s*(" end=")" oneline keepend

syn match csImportant "!\s*important\>"

syn keyword csCommonAttr auto none inherit
syn keyword csCommonAttr top bottom
syn keyword csCommonAttr medium normal

syn match csFontProp "\<font\(-\(family\|style\|variant\|weight\|size\(-adjust\)\=\|stretch\)\)\=\>"
syn match csFontAttr "\<\(sans-\)\=\<serif\>"
syn match csFontAttr "\<small\(-\(caps\|caption\)\)\=\>"
syn match csFontAttr "\<x\{1,2\}-\(large\|small\)\>"
syn match csFontAttr "\<message-box\>"
syn match csFontAttr "\<status-bar\>"
syn match csFontAttr "\<\(\(ultra\|extra\|semi\|status-bar\)-\)\=\(condensed\|expanded\)\>"
syn keyword csFontAttr cursive fantasy monospace italic oblique
syn keyword csFontAttr bold bolder lighter larger smaller
syn keyword csFontAttr icon menu
syn match csFontAttr "\<caption\>"
syn keyword csFontAttr large smaller larger
syn keyword csFontAttr narrower wider

syn keyword csColorProp color
syn match csColorProp "\<background\(-\(color\|image\|attachment\|position\)\)\=\>"
syn keyword csColorAttr center scroll fixed
syn match csColorAttr "\<repeat\(-[xy]\)\=\>"
syn match csColorAttr "\<no-repeat\>"

syn match csTextProp "\<\(\(word\|letter\)-spacing\|text\(-\(decoration\|transform\|align\|index\|shadow\)\)\=\|vertical-align\|unicode-bidi\|line-height\)\>"
syn match csTextAttr "\<line-through\>"
syn match csTextAttr "\<text-indent\>"
syn match csTextAttr "\<\(text-\)\=\(top\|bottom\)\>"
syn keyword csTextAttr underline overline blink sub super middle
syn keyword csTextAttr capitalize uppercase lowercase center justify baseline sub super

syn match csBoxProp "\<\(margin\|padding\|border\)\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match csBoxProp "\<border-\(\(\(top\|right\|bottom\|left\)-\)\=\(width\|color\|style\)\)\=\>"
syn match csBoxProp "\<\(width\|z-index\)\>"
syn match csBoxProp "\<\(min\|max\)-\(width\|height\)\>"
syn keyword csBoxProp width height float clear overflow clip visibility
syn keyword csBoxAttr thin thick both
syn keyword csBoxAttr dotted dashed solid double groove ridge inset outset
syn keyword csBoxAttr hidden visible scroll collapse

syn keyword csGeneratedContentProp content quotes
syn match csGeneratedContentProp "\<counter-\(reset\|increment\)\>"
syn match csGeneratedContentProp "\<list-style\(-\(type\|position\|image\)\)\=\>"
syn match csGeneratedContentAttr "\<\(no-\)\=\(open\|close\)-quote\>"
syn match csAuralAttr "\<lower\>"
syn match csGeneratedContentAttr "\<\(lower\|upper\)-\(roman\|alpha\|greek\|latin\)\>"
syn match csGeneratedContentAttr "\<\(hiragana\|katakana\)\(-iroha\)\=\>"
syn match csGeneratedContentAttr "\<\(decimal\(-leading-zero\)\=\|cjk-ideographic\)\>"
syn keyword csGeneratedContentAttr disc circle square hebrew armenian georgian
syn keyword csGeneratedContentAttr inside outside

syn match csPagingProp "\<page\(-break-\(before\|after\|inside\)\)\=\>"
syn keyword csPagingProp size marks inside orphans widows
syn keyword csPagingAttr landscape portrait crop cross always avoid

syn keyword csUIProp cursor
syn match csUIProp "\<outline\(-\(width\|style\|color\)\)\=\>"
syn match csUIAttr "\<[ns]\=[ew]\=-resize\>"
syn keyword csUIAttr default crosshair pointer move wait help
syn keyword csUIAttr thin thick
syn keyword csUIAttr dotted dashed solid double groove ridge inset outset
syn keyword csUIAttr invert

syn match csRenderAttr "\<marker\>"
syn match csRenderProp "\<\(display\|marker-offset\|unicode-bidi\|white-space\|list-item\|run-in\|inline-table\)\>"
syn keyword csRenderProp position top bottom direction
syn match csRenderProp "\<\(left\|right\)\>"
syn keyword csRenderAttr block inline compact
syn match csRenderAttr "\<table\(-\(row-gorup\|\(header\|footer\)-group\|row\|column\(-group\)\=\|cell\|caption\)\)\=\>"
syn keyword csRenderAttr static relative absolute fixed
syn keyword csRenderAttr ltr rtl embed bidi-override pre nowrap
syn match csRenderAttr "\<bidi-override\>"

syn match csAuralProp "\<\(pause\|cue\)\(-\(before\|after\)\)\=\>"
syn match csAuralProp "\<\(play-during\|speech-rate\|voice-family\|pitch\(-range\)\=\|speak\(-\(punctuation\|numerals\)\)\=\)\>"
syn keyword csAuralProp volume during azimuth elevation stress richness
syn match csAuralAttr "\<\(x-\)\=\(soft\|loud\)\>"
syn keyword csAuralAttr silent
syn match csAuralAttr "\<spell-out\>"
syn keyword csAuralAttr non mix
syn match csAuralAttr "\<\(left\|right\)-side\>"
syn match csAuralAttr "\<\(far\|center\)-\(left\|center\|right\)\>"
syn keyword csAuralAttr leftwards rightwards behind
syn keyword csAuralAttr below level above higher
syn match csAuralAttr "\<\(x-\)\=\(slow\|fast\)\>"
syn keyword csAuralAttr faster slower
syn keyword csAuralAttr male female child code digits continuous

syn match csTableProp "\<\(caption-side\|table-layout\|border-collapse\|border-spacing\|empty-cells\|speak-header\)\>"
syn keyword csTableAttr fixed collapse separate show hide once always

" FIXME: This allows csMediaBlock before the semicolon, which is wrong.

syn match csPseudoClass ":\S\+" contains=csPseudoClassId,csUnicodeEscape
syn keyword csPseudoClassId contained link visited active hover focus before after left right
syn match csPseudoClassId contained "\<first\(-\(line\|letter\|child\)\)\=\>"
syn region csPseudoClassLang matchgroup=csPseudoClassId start=":lang(" end=")" oneline

syn region csComment start="/\*" end="\*/" contains=@Spell

syn match csUnicodeEscape "\\\x\{1,6}\s\?" contained
syn match csSpecialCharQQ +\\"+ contained
syn match csSpecialCharQ +\\'+ contained
syn region csStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=csUnicodeEscape,csSpecialCharQQ
syn region csStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=csUnicodeEscape,csSpecialCharQ
syn match csClassName "\.[A-Za-z][A-Za-z0-9_-]\+"

" custom cassius stuff
syn region csStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=csVar,csRoute
syn region csStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=csVar,csRoute
syn match csVar /\#{[^}]*}/ contains=csStringQ,csStringQQ,csHsOp
syn match csRoute /@{[^}]*}/ contains=csStringQ,csStringQQ,csHsOp
syn match csHsOp contained /\(\$\|\.\)/

if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

HiLink csComment Comment
HiLink csTagName Statement
HiLink csSelectorOp Special
HiLink csSelectorOp2 Special
HiLink csFontProp StorageClass
HiLink csColorProp StorageClass
HiLink csTextProp StorageClass
HiLink csBoxProp StorageClass
HiLink csRenderProp StorageClass
HiLink csAuralProp StorageClass
HiLink csRenderProp StorageClass
HiLink csGeneratedContentProp StorageClass
HiLink csPagingProp StorageClass
HiLink csTableProp StorageClass
HiLink csUIProp StorageClass
HiLink csFontAttr Type
HiLink csColorAttr Type
HiLink csTextAttr Type
HiLink csBoxAttr Type
HiLink csRenderAttr Type
HiLink csAuralAttr Type
HiLink csGeneratedContentAttr Type
HiLink csPagingAttr Type
HiLink csTableAttr Type
HiLink csUIAttr Type
HiLink csCommonAttr Type
HiLink csPseudoClassId PreProc
HiLink csPseudoClassLang Constant
HiLink csValueLength Number
HiLink csValueInteger Number
HiLink csValueNumber Number
HiLink csValueAngle Number
HiLink csValueTime Number
HiLink csValueFrequency Number
HiLink csFunction Constant
HiLink csURL String
HiLink csFunctionName Function
HiLink csColor Constant
HiLink csIdentifier Function
HiLink csInclude Include
HiLink csImportant Special
HiLink csBraces Function
HiLink csBraceError Error
HiLink csError Error
HiLink csInclude Include
HiLink csUnicodeEscape Special
HiLink csStringQQ String
HiLink csStringQ String
HiLink csMedia Special
HiLink csMediaType Special
HiLink csMediaComma Normal
HiLink csFontDescriptor Special
HiLink csFontDescriptorFunction Constant
HiLink csFontDescriptorProp StorageClass
HiLink csFontDescriptorAttr Type
HiLink csUnicodeRange Constant
HiLink csClassName Function

HiLink csStringQQ String
HiLink csStringQ  String
HiLink csVar      Structure
HiLink csRoute    Type
HiLink csHsOp     Operator

delcommand HiLink

let b:current_syntax = 'cassius'

if main_syntax == 'cassius'
  unlet main_syntax
endif
