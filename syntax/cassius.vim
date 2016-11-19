" Vim syntax file
" Language: Cassius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  MIT
"
" This is basically css.vim, but with most values not contained (braces
" aren't needed in cassius) and a few features removed.
"
"""

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'cassius'
elseif exists("b:current_syntax") && b:current_syntax == "cassius"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" HTML4 tags
syn keyword cssTagName abbr address area a b base
syn keyword cssTagName bdo blockquote body br button
syn keyword cssTagName caption cite code col colgroup dd del
syn keyword cssTagName dfn div dl dt em fieldset form
syn keyword cssTagName h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script small
syn keyword cssTagName span strong sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr ul u var
syn keyword cssTagName object svg
syn match   cssTagName /\<select\>\|\<style\>\|\<table\>/

" 34 HTML5 tags
syn keyword cssTagName article aside audio bdi canvas command data
syn keyword cssTagName datalist details dialog embed figcaption figure footer
syn keyword cssTagName header hgroup keygen main mark menuitem meter nav
syn keyword cssTagName output progress rt rp ruby section
syn keyword cssTagName source summary time track video wbr

" Tags not supported in HTML5
" acronym applet basefont big center dir
" font frame frameset noframes strike tt

syn match cssTagName "\*"

" selectors
syn match cssSelectorOp "[,>+~]"
syn match cssSelectorOp2 "[~|^$*]\?=" contained
syn region cssAttributeSelector matchgroup=cssSelectorOp start="\[" end="]" contains=cssUnicodeEscape,cssSelectorOp2,cssStringQ,cssStringQQ

" .class and #id
syn match cssClassName "\.[A-Za-z][A-Za-z0-9_-]\+" contains=cssClassNameDot
syn match cssClassNameDot contained '\.'

try
syn match cssIdentifier "#[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
catch /^.*/
syn match cssIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
endtry

" digits
syn match cssValueInteger "[-+]\=\d\+" contains=cssUnitDecorators
syn match cssValueNumber "[-+]\=\d\+\(\.\d*\)\=" contains=cssUnitDecorators
syn match cssValueLength "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|rem\|dpi\|dppx\|dpcm\)\>" contains=cssUnitDecorators
syn match cssValueAngle "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\)\>" contains=cssUnitDecorators
syn match cssValueTime "+\=\d\+\(\.\d*\)\=\(ms\|s\)\>" contains=cssUnitDecorators
syn match cssValueFrequency "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)\>" contains=cssUnitDecorators

" @media
syn region cssInclude start=/@media\>/ end=/\ze{/ skipwhite skipnl contains=cssMediaProp,cssValueLength,cssMediaKeyword,cssValueInteger,cssMediaAttr,cssVendor,cssMediaType,cssIncludeKeyword,cssMediaComma,cssComment nextgroup=cssMediaBlock
syn keyword cssMediaType contained screen print aural braille embossed handheld projection tty tv speech all contained skipwhite skipnl
syn keyword cssMediaKeyword only not and contained
syn region cssMediaBlock transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssTagName,cssClassName,cssIdentifier,cssPseudoClass,cssSelectorOp,cssSelectorOp2,cssAttributeSelector fold
syn match cssMediaComma "," skipwhite skipnl contained

" Reference: http://www.w3.org/TR/css3-mediaqueries/
syn keyword cssMediaProp contained width height orientation scan grid
syn match cssMediaProp contained /\(\(max\|min\)-\)\=\(\(device\)-\)\=aspect-ratio/
syn match cssMediaProp contained /\(\(max\|min\)-\)\=device-pixel-ratio/
syn match cssMediaProp contained /\(\(max\|min\)-\)\=device-\(height\|width\)/
syn match cssMediaProp contained /\(\(max\|min\)-\)\=\(height\|width\|resolution\|monochrome\|color\(-index\)\=\)/
syn keyword cssMediaAttr contained portrait landscape progressive interlace

" @page
" http://www.w3.org/TR/css3-page/
syn match cssPage "@page\>[^{]*{\@=" contains=cssPagePseudo,cssIncludeKeyword nextgroup=cssPageWrap transparent skipwhite skipnl
syn match cssPagePseudo /:\(left\|right\|first\|blank\)/ contained skipwhite skipnl
syn region cssPageWrap contained transparent matchgroup=cssBraces start="{" end="}" contains=cssPageMargin,cssPageProp,cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks
syn match cssPageMargin /@\(\(top\|left\|right\|bottom\)-\(left\|center\|right\|middle\|bottom\)\)\(-corner\)\=/ contained nextgroup=cssDefinition skipwhite skipnl
syn keyword cssPageProp contained content size
" http://www.w3.org/TR/CSS2/page.html#break-inside
syn keyword cssPageProp contained orphans widows

" @keyframe
" http://www.w3.org/TR/css3-animations/#keyframes
syn match cssKeyFrame "@\(-[a-z]\+-\)\=keyframes\>[^{]*{\@=" nextgroup=cssKeyFrameWrap contains=cssVendor,cssIncludeKeyword skipwhite skipnl transparent
syn region cssKeyFrameWrap contained transparent matchgroup=cssBraces start="{" end="}" contains=cssKeyFrameSelector
syn match cssKeyFrameSelector /\(\d*%\|from\|to\)\=/  contained skipwhite skipnl nextgroup=cssDefinition
" @font-face
" http://www.w3.org/TR/css3-fonts/#at-font-face-rule
syn match cssFontDescriptor "@font-face\>" nextgroup=cssFontDescriptorBlock skipwhite skipnl
syn region cssFontDescriptorBlock contained transparent matchgroup=cssBraces start="{" end="}" contains=cssComment,cssError,cssUnicodeEscape,cssCommonAttr,cssFontDescriptorProp,cssValue.*,cssFontDescriptorFunction,cssFontDescriptorAttr,cssNoise

syn match cssFontDescriptorProp contained "\<font-family\>"
syn keyword cssFontDescriptorProp contained src
syn match cssFontDescriptorProp contained "\<font-\(style\|weight\|stretch\)\>"
syn match cssFontDescriptorProp contained "\<unicode-range\>"
syn match cssFontDescriptorProp contained "\<font-\(variant\|feature-settings\)\>"

" src functions
syn region cssFontDescriptorFunction contained matchgroup=cssFunctionName start="\<\(uri\|url\|local\|format\)\s*(" end=")" contains=cssStringQ,cssStringQQ oneline keepend
" font-sytle and font-weight attributes
syn keyword cssFontDescriptorAttr contained normal italic oblique bold
" font-stretch attributes
syn match cssFontDescriptorAttr contained "\<\(\(ultra\|extra\|semi\)-\)\=\(condensed\|expanded\)\>"
" unicode-range attributes
syn match cssFontDescriptorAttr contained "U+[0-9A-Fa-f?]\+"
syn match cssFontDescriptorAttr contained "U+\x\+-\x\+"
" font-feature-settings attributes
syn keyword cssFontDescriptorAttr contained on off



" The 16 basic color names
syn keyword cssColor aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal yellow

" 130 more color names
syn keyword cssColor aliceblue antiquewhite aquamarine azure
syn keyword cssColor beige bisque blanchedalmond blueviolet brown burlywood
syn keyword cssColor cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan
syn match cssColor /\<dark\(blue\|cyan\|goldenrod\|gray\|green\|grey\|khaki\)\>/
syn match cssColor /\<dark\(magenta\|olivegreen\|orange\|orchid\|red\|salmon\|seagreen\)\>/
syn match cssColor /\<darkslate\(blue\|gray\|grey\)\>/
syn match cssColor /\<dark\(turquoise\|violet\)\>/
syn keyword cssColor deeppink deepskyblue dimgray dimgrey dodgerblue firebrick
syn keyword cssColor floralwhite forestgreen gainsboro ghostwhite gold
syn keyword cssColor goldenrod greenyellow grey honeydew hotpink
syn keyword cssColor indianred indigo ivory khaki lavender lavenderblush lawngreen
syn keyword cssColor lemonchiffon limegreen linen magenta
syn match cssColor /\<light\(blue\|coral\|cyan\|goldenrodyellow\|gray\|green\)\>/
syn match cssColor /\<light\(grey\|pink\|salmon\|seagreen\|skyblue\|yellow\)\>/
syn match cssColor /\<light\(slategray\|slategrey\|steelblue\)\>/
syn match cssColor /\<medium\(aquamarine\|blue\|orchid\|purple\|seagreen\)\>/
syn match cssColor /\<medium\(slateblue\|springgreen\|turquoise\|violetred\)\>/
syn keyword cssColor midnightblue mintcream mistyrose moccasin navajowhite
syn keyword cssColor oldlace olivedrab orange orangered orchid
syn match cssColor /\<pale\(goldenrod\|green\|turquoise\|violetred\)\>/
syn keyword cssColor papayawhip peachpuff peru pink plum powderblue
syn keyword cssColor rosybrown royalblue saddlebrown salmon sandybrown
syn keyword cssColor seagreen seashell sienna skyblue slateblue
syn keyword cssColor slategray slategrey snow springgreen steelblue tan
syn keyword cssColor thistle tomato turquoise violet wheat
syn keyword cssColor whitesmoke yellowgreen

" FIXME: These are actually case-insensitive too, but (a) specs recommend using
" mixed-case (b) it's hard to highlight the word `Background' correctly in
" all situations
syn case match
syn keyword cssColor ActiveBorder ActiveCaption AppWorkspace ButtonFace ButtonHighlight ButtonShadow ButtonText CaptionText GrayText Highlight HighlightText InactiveBorder InactiveCaption InactiveCaptionText InfoBackground InfoText Menu MenuText Scrollbar ThreeDDarkShadow ThreeDFace ThreeDHighlight ThreeDLightShadow ThreeDShadow Window WindowFrame WindowText Background
syn case ignore

syn match cssImportant "!\s*important\>"

syn match cssColor "\<transparent\>"
syn match cssColor "\<currentColor\>"
syn match cssColor "\<white\>"
syn match cssColor "#[0-9A-Fa-f]\{3\}\>" contains=cssUnitDecorators
syn match cssColor "#[0-9A-Fa-f]\{6\}\>" contains=cssUnitDecorators

syn region cssURL matchgroup=cssFunctionName start="\<url\s*(" end=")" contains=cssStringQ,cssStringQQ,cssRoute oneline
syn region cssFunction matchgroup=cssFunctionName start="\<\(rgb\|clip\|attr\|counter\|rect\|cubic-bezier\|steps\)\s*(" end=")" oneline  contains=cssValueInteger,cssValueNumber,cssValueLength,cssFunctionComma
syn region cssFunction matchgroup=cssFunctionName start="\<\(rgba\|hsl\|hsla\|color-stop\|from\|to\)\s*(" end=")" oneline  contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunctionComma,cssFunction
syn region cssFunction matchgroup=cssFunctionName start="\<\(linear-\|radial-\)\=\gradient\s*(" end=")" oneline  contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunction,cssGradientAttr,cssFunctionComma
syn region cssFunction matchgroup=cssFunctionName start="\<\(matrix\(3d\)\=\|scale\(3d\|X\|Y\|Z\)\=\|translate\(3d\|X\|Y\|Z\)\=\|skew\(X\|Y\)\=\|rotate\(3d\|X\|Y\|Z\)\=\|perspective\)\s*(" end=")" oneline contains=cssValueInteger,cssValueNumber,cssValueLength,cssValueAngle,cssFunctionComma
syn keyword cssGradientAttr top bottom left right cover center middle ellipse at
syn match cssFunctionComma contained ","

" Common Prop and Attr
syn keyword cssCommonAttr auto none inherit all default normal
syn keyword cssCommonAttr top bottom center stretch hidden visible
"------------------------------------------------
" CSS Animations
" http://www.w3.org/TR/css3-animations/
syn match cssAnimationProp "\<animation\(-\(delay\|direction\|duration\|fill-mode\|name\|play-state\|timing-function\|iteration-count\)\)\=\>"

" animation-direction attributes
syn keyword cssAnimationAttr alternate reverse
syn match cssAnimationAttr "\<alternate-reverse\>"

" animation-fill-mode attributes
syn keyword cssAnimationAttr forwards backwards both

" animation-play-state attributes
syn keyword cssAnimationAttr running paused

" animation-iteration-count attributes
syn keyword cssAnimationAttr infinite
"------------------------------------------------
"  CSS Backgrounds and Borders Module Level 3
"  http://www.w3.org/TR/css3-background/
syn match cssBackgroundProp "\<background\(-\(attachment\|clip\|color\|image\|origin\|position\|repeat\|size\)\)\=\>"
" background-attachment attributes
syn keyword cssBackgroundAttr scroll fixed local

" background-position attributes
syn keyword cssBackgroundAttr left center right top bottom

" background-repeat attributes
syn match cssBackgroundAttr "\<no-repeat\>"
syn match cssBackgroundAttr "\<repeat\(-[xy]\)\=\>"
syn keyword cssBackgroundAttr space round

" background-size attributes
syn keyword cssBackgroundAttr cover contain

syn match cssBorderProp "\<border\(-\(top\|right\|bottom\|left\)\)\=\(-\(width\|color\|style\)\)\=\>"
syn match cssBorderProp "\<border\(-\(top\|bottom\)-\(left\|right\)\)\=-radius\>"
syn match cssBorderProp "\<border-image\(-\(outset\|repeat\|slice\|source\|width\)\)\=\>"
syn match cssBorderProp "\<box-decoration-break\>"
syn match cssBorderProp "\<box-shadow\>"

" border-image attributes
syn keyword cssBorderAttr stretch round space fill

" border-style attributes
syn keyword cssBorderAttr dotted dashed solid double groove ridge inset outset

" border-width attributes
syn keyword cssBorderAttr thin thick medium

" box-decoration-break attributes
syn keyword cssBorderAttr clone slice
"------------------------------------------------

syn match cssBoxProp "\<padding\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match cssBoxProp "\<margin\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match cssBoxProp "\<overflow\(-\(x\|y\|style\)\)\=\>"
syn match cssBoxProp "\<rotation\(-point\)\=\>"
syn keyword cssBoxAttr visible hidden scroll auto
syn match cssBoxAttr "\<no-\(display\|content\)\>"

syn keyword cssColorProp opacity
syn match cssColorProp "\<color-profile\>"
syn match cssColorProp "\<rendering-intent\>"


syn match cssDimensionProp "\<\(min\|max\)-\(width\|height\)\>"
syn keyword cssDimensionProp height
syn keyword cssDimensionProp width

" shadow and sizing are in other property groups
syn match cssFlexibleBoxProp "\<box-\(align\|direction\|flex\|ordinal-group\|orient\|pack\|shadow\|sizing\)\>"
syn keyword cssFlexibleBoxAttr start end baseline
syn keyword cssFlexibleBoxAttr reverse
syn keyword cssFlexibleBoxAttr single multiple
syn keyword cssFlexibleBoxAttr horizontal
syn match cssFlexibleBoxAttr "\<vertical\(-align\)\@!\>" "escape vertical-align
syn match cssFlexibleBoxAttr "\<\(inline\|block\)-axis\>"

" CSS Fonts Module Level 3
" http://www.w3.org/TR/css-fonts-3/
syn match cssFontProp "\<font\(-\(family\|\|feature-settings\|kerning\|language-override\|size\(-adjust\)\=\|stretch\|style\|synthesis\|variant\(-\(alternates\|caps\|east-asian\|ligatures\|numeric\|position\)\)\=\|weight\)\)\=\>"

" font attributes
syn keyword cssFontAttr icon menu caption
syn match cssFontAttr "\<small\(-\(caps\|caption\)\)\=\>"
syn match cssFontAttr "\<message-box\>"
syn match cssFontAttr "\<status-bar\>"
syn keyword cssFontAttr larger smaller
syn match cssFontAttr "\<\(x\{1,2\}-\)\=\(large\|small\)\>"
" font-family attributes
syn match cssFontAttr "\<\(sans-\)\=\<serif\>"
syn keyword cssFontAttr Antiqua Arial Black Book Charcoal Comic Courier Dingbats Gadget Geneva Georgia Grande Helvetica Impact Linotype Lucida MS Monaco Neue New Palatino Roboto Roman Symbol Tahoma Times Trebuchet Verdana Webdings Wingdings York Zapf
syn keyword cssFontAttr cursive fantasy monospace
" font-feature-settings attributes
syn keyword cssFontAttr on off
" font-stretch attributes
syn match cssFontAttr "\<\(\(ultra\|extra\|semi\)-\)\=\(condensed\|expanded\)\>"
" font-style attributes
syn keyword cssFontAttr italic oblique
" font-synthesis attributes
syn keyword cssFontAttr weight style
" font-weight attributes
syn keyword cssFontAttr bold bolder lighter
" TODO: font-variant-* attributes
"------------------------------------------------

" Webkit specific property/attributes
syn match cssFontProp "\<font-smooth\>"
syn match cssFontAttr "\<\(subpixel-\)\=\antialiased\>"





" CSS Multi-column Layout Module
" http://www.w3.org/TR/css3-multicol/
syn match cssMultiColumnProp "\<break-\(after\|before\|inside\)\>"
syn match cssMultiColumnProp "\<column-\(count\|fill\|gap\|rule\(-\(color\|style\|width\)\)\=\|span\|width\)\>"
syn keyword cssMultiColumnProp columns
syn keyword cssMultiColumnAttr balance medium
syn keyword cssMultiColumnAttr always avoid left right page column
syn match cssMultiColumnAttr "\<avoid-\(page\|column\)\>"

" http://www.w3.org/TR/css3-break/#page-break
syn match cssMultiColumnProp "\<page\(-break-\(before\|after\|inside\)\)\=\>"

" TODO find following items in w3c docs.
syn keyword cssGeneratedContentProp quotes crop
syn match cssGeneratedContentProp "\<counter-\(reset\|increment\)\>"
syn match cssGeneratedContentProp "\<move-to\>"
syn match cssGeneratedContentProp "\<page-policy\>"
syn match cssGeneratedContentAttr "\<\(no-\)\=\(open\|close\)-quote\>"

syn match cssGridProp "\<grid-\(columns\|rows\)\>"

syn match cssHyerlinkProp "\<target\(-\(name\|new\|position\)\)\=\>"

syn match cssListProp "\<list-style\(-\(type\|position\|image\)\)\=\>"
syn match cssListAttr "\<\(lower\|upper\)-\(roman\|alpha\|greek\|latin\)\>"
syn match cssListAttr "\<\(hiragana\|katakana\)\(-iroha\)\=\>"
syn match cssListAttr "\<\(decimal\(-leading-zero\)\=\|cjk-ideographic\)\>"
syn keyword cssListAttr disc circle square hebrew armenian georgian
syn keyword cssListAttr inside outside

syn keyword cssPositioningProp bottom clear clip display float left
syn keyword cssPositioningProp position right top visibility
syn match cssPositioningProp "\<z-index\>"
syn keyword cssPositioningAttr block compact
syn match cssPositioningAttr "\<table\(-\(row-group\|\(header\|footer\)-group\|row\|column\(-group\)\=\|cell\|caption\)\)\=\>"
syn keyword cssPositioningAttr left right both
syn match cssPositioningAttr "\<list-item\>"
syn match cssPositioningAttr "\<inline\(-\(block\|box\|table\)\)\=\>"
syn keyword cssPositioningAttr static relative absolute fixed

syn keyword cssPrintAttr landscape portrait crop cross always avoid

syn match cssTableProp "\<\(caption-side\|table-layout\|border-collapse\|border-spacing\|empty-cells\)\>"
syn keyword cssTableAttr fixed collapse separate show hide once always


syn keyword cssTextProp color direction
syn match cssTextProp "\<\(\(word\|letter\)-spacing\|text\(-\(decoration\|transform\|align\|index\|shadow\)\)\=\|vertical-align\|unicode-bidi\|line-height\)\>"
syn match cssTextProp "\<text-\(justify\|outline\|warp\|align-last\|size-adjust\|rendering\|stroke\|indent\)\>"
syn match cssTextProp "\<word-\(break\|\wrap\)\>"
syn match cssTextProp "\<white-space\>"
syn match cssTextProp "\<hanging-punctuation\>"
syn match cssTextProp "\<punctuation-trim\>"
syn match cssTextAttr "\<line-through\>"
syn match cssTextAttr "\<\(text-\)\=\(top\|bottom\)\>"
syn keyword cssTextAttr ltr rtl embed nowrap
syn keyword cssTextAttr underline overline blink sub super middle
syn keyword cssTextAttr capitalize uppercase lowercase center justify baseline sub super
syn keyword cssTextAttr justify baseline sub super
syn keyword cssTextAttr optimizeLegibility optimizeSpeed
syn match cssTextAttr "\<pre\(-\(line\|wrap\)\)\=\>"
syn match cssTextAttr "\<\(allow\|force\)-end\>"
syn keyword cssTextAttr start end adjacent
syn match cssTextAttr "\<inter-\(word\|ideographic\|cluster\)\>"
syn keyword cssTextAttr distribute kashida first last
syn keyword cssTextAttr clip ellipsis unrestricted suppress
syn match cssTextAttr "\<break-all\>"
syn match cssTextAttr "\<break-word\>"
syn keyword cssTextAttr hyphenate
syn match cssTextAttr "\<bidi-override\>"

syn match cssTransformProp "\<transform\(-\(origin\|style\)\)\=\>"
syn match cssTransformProp "\<perspective\(-origin\)\=\>"
syn match cssTransformProp "\<backface-visibility\>"

" CSS Transitions
" http://www.w3.org/TR/css3-transitions/
syn match cssTransitionProp "\<transition\(-\(delay\|duration\|property\|timing-function\)\)\=\>"

" transition-time-function attributes
syn match cssTransitionAttr "\<linear\(-gradient\)\@!\>"
syn match cssTransitionAttr "\<ease\(-\(in-out\|out\|in\)\)\=\>"
syn match cssTransitionAttr "\<step\(-start\|-end\)\=\>"
"------------------------------------------------
" CSS Basic User Interface Module Level 3 (CSS3 UI)
" http://www.w3.org/TR/css3-ui/
syn match cssUIProp "\<box-sizing\>"
syn match cssUIAttr "\<\(content\|padding\|border\)\(-box\)\=\>"

syn keyword cssUIProp cursor
syn match cssUIAttr "\<\(\([ns]\=[ew]\=\)\|col\|row\|nesw\|nwse\)-resize\>"
syn keyword cssUIAttr crosshair help move pointer alias copy
syn keyword cssUIAttr progress wait text cell move
syn match cssUIAttr "\<context-menu\>"
syn match cssUIAttr "\<no-drop\>"
syn match cssUIAttr "\<not-allowed\>"
syn match cssUIAttr "\<all-scroll\>"
syn match cssUIAttr "\<\(vertical-\)\=text\>"
syn match cssUIAttr "\<zoom\(-in\|-out\)\=\>"

syn match cssUIProp "\<ime-mode\>"
syn keyword cssUIAttr active inactive disabled

syn match cssUIProp "\<nav-\(down\|index\|left\|right\|up\)\=\>"
syn match cssUIProp "\<outline\(-\(width\|style\|color\|offset\)\)\=\>"
syn keyword cssUIAttr invert

syn keyword cssUIProp icon resize
syn keyword cssUIAttr both horizontal vertical

syn match cssUIProp "\<text-overflow\>"
syn keyword cssUIAttr clip ellipsis

" Already highlighted Props: font content
"------------------------------------------------
" Webkit/iOS specific attributes
syn match cssUIAttr '\(preserve-3d\)'
" IE specific attributes
syn match cssIEUIAttr '\(bicubic\)'

" Webkit/iOS specific properties
syn match cssUIProp '\(tap-highlight-color\|user-select\|touch-callout\)'
" IE specific properties
syn match cssIEUIProp '\(interpolation-mode\|zoom\|filter\)'

" Webkit/Firebox specific properties/attributes
syn keyword cssUIProp appearance
syn keyword cssUIAttr window button field icon document menu


syn match cssAuralProp "\<\(pause\|cue\)\(-\(before\|after\)\)\=\>"
syn match cssAuralProp "\<\(play-during\|speech-rate\|voice-family\|pitch\(-range\)\=\|speak\(-\(punctuation\|numeral\|header\)\)\=\)\>"
syn keyword cssAuralProp volume during azimuth elevation stress richness
syn match cssAuralAttr "\<\(x-\)\=\(soft\|loud\)\>"
syn keyword cssAuralAttr silent
syn match cssAuralAttr "\<spell-out\>"
syn keyword cssAuralAttr non mix
syn match cssAuralAttr "\<\(left\|right\)-side\>"
syn match cssAuralAttr "\<\(far\|center\)-\(left\|center\|right\)\>"
syn keyword cssAuralAttr leftwards rightwards behind
syn keyword cssAuralAttr below level above lower higher
syn match cssAuralAttr "\<\(x-\)\=\(slow\|fast\|low\|high\)\>"
syn keyword cssAuralAttr faster slower
syn keyword cssAuralAttr male female child code digits continuous

" mobile text
syn match cssMobileTextProp "\<text-size-adjust\>"




" Pseudo class
" http://www.w3.org/TR/css3-selectors/
syn match cssPseudoClass ":[A-Za-z0-9_-]*" contains=cssNoise,cssPseudoClassId,cssUnicodeEscape,cssVendor,cssPseudoClassFn
syn keyword cssPseudoClassId contained link visited active hover before after left right
syn keyword cssPseudoClassId contained root empty target enable disabled checked invalid
syn match cssPseudoClassId contained "\<first-\(line\|letter\)\>"
syn match cssPseudoClassId contained "\<\(first\|last\|only\)-\(of-type\|child\)\>"
syn region cssPseudoClassFn contained matchgroup=cssFunctionName start="\<\(not\|lang\|\(nth\|nth-last\)-\(of-type\|child\)\)(" end=")"
" ------------------------------------
" Vendor specific properties
syn match cssPseudoClassId contained  "\<selection\>"
syn match cssPseudoClassId contained  "\<focus\(-inner\)\=\>"
syn match cssPseudoClassId contained  "\<\(input-\)\=placeholder\>"

" Misc highlight groups
syntax match cssUnitDecorators /\(#\|-\|%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|ch\|rem\|vh\|vw\|vmin\|vmax\|dpi\|dppx\|dpcm\|Hz\|kHz\|s\|ms\|deg\|grad\|rad\)/ contained
syntax match cssNoise contained /\(:\|;\|\/\)/

" Comment
syn region cssComment start="/\*" end="\*/" contains=@Spell fold

syn match cssUnicodeEscape "\\\x\{1,6}\s\?"
syn match cssSpecialCharQQ +\\\\\|\\"+ contained
syn match cssSpecialCharQ +\\\\\|\\'+ contained
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssUnicodeEscape,cssSpecialCharQQ
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssUnicodeEscape,cssSpecialCharQ

" Vendor Prefix
syn match cssVendor contained "\(-\(webkit\|moz\|o\|ms\)-\)"

" Various CSS Hack characters
" In earlier versions of IE (6 and 7), one can prefix property names
" with a _ or * to isolate those definitions to particular versions of IE
" This is purely decorative and therefore we assign to the same highlight
" group to cssVendor, for more information:
" http://www.paulirish.com/2009/browser-specific-css-hacks/
syn match cssHacks contained /\(_\|*\)/

" Attr Enhance
" Some keywords are both Prop and Attr, so we have to handle them
syn region cssAttrRegion start=/:/ end=/\ze\(;\|)\|}\)/ contained contains=css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise

" Hack for transition
" 'transition' has Props after ':'.
syn region cssAttrRegion start=/transition\s*:/ end=/\ze\(;\|)\|}\)/ contained contains=css.*Prop,css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise

syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssVar,cssRoute
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssVar,cssRoute
syn match cssVar /\#{[^}]*}/ contains=cssStringQ,cssStringQQ,cssHsOp
syn match cssRoute /@{[^}]*}/ contains=cssStringQ,cssStringQQ,cssHsOp
syn match cssRoute /@?{[^}]*}/ contains=cssStringQ,cssStringQQ,cssHsOp
syn match cssHsOp contained /\(\$\|\.\)/

if main_syntax == "cassius"
  syn sync minlines=10
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cssComment Comment
  HiLink cssVendor Comment
  HiLink cssHacks Comment
  HiLink cssTagName Statement
  HiLink cssDeprecated Error
  HiLink cssSelectorOp Special
  HiLink cssSelectorOp2 Special
  HiLink cssAttrComma Special

  HiLink cssAnimationProp cssProp
  HiLink cssBackgroundProp cssProp
  HiLink cssBorderProp cssProp
  HiLink cssBoxProp cssProp
  HiLink cssColorProp cssProp
  HiLink cssContentForPagedMediaProp cssProp
  HiLink cssDimensionProp cssProp
  HiLink cssFlexibleBoxProp cssProp
  HiLink cssFontProp cssProp
  HiLink cssGeneratedContentProp cssProp
  HiLink cssGridProp cssProp
  HiLink cssHyerlinkProp cssProp
  HiLink cssLineboxProp cssProp
  HiLink cssListProp cssProp
  HiLink cssMarqueeProp cssProp
  HiLink cssMultiColumnProp cssProp
  HiLink cssPagedMediaProp cssProp
  HiLink cssPositioningProp cssProp
  HiLink cssPrintProp cssProp
  HiLink cssRubyProp cssProp
  HiLink cssSpeechProp cssProp
  HiLink cssTableProp cssProp
  HiLink cssTextProp cssProp
  HiLink cssTransformProp cssProp
  HiLink cssTransitionProp cssProp
  HiLink cssUIProp cssProp
  HiLink cssIEUIProp cssProp
  HiLink cssAuralProp cssProp
  HiLink cssRenderProp cssProp
  HiLink cssMobileTextProp cssProp

  HiLink cssAnimationAttr cssAttr
  HiLink cssBackgroundAttr cssAttr
  HiLink cssBorderAttr cssAttr
  HiLink cssBoxAttr cssAttr
  HiLink cssContentForPagedMediaAttr cssAttr
  HiLink cssDimensionAttr cssAttr
  HiLink cssFlexibleBoxAttr cssAttr
  HiLink cssFontAttr cssAttr
  HiLink cssGeneratedContentAttr cssAttr
  HiLink cssGridAttr cssAttr
  HiLink cssHyerlinkAttr cssAttr
  HiLink cssLineboxAttr cssAttr
  HiLink cssListAttr cssAttr
  HiLink cssMarginAttr cssAttr
  HiLink cssMarqueeAttr cssAttr
  HiLink cssMultiColumnAttr cssAttr
  HiLink cssPaddingAttr cssAttr
  HiLink cssPagedMediaAttr cssAttr
  HiLink cssPositioningAttr cssAttr
  HiLink cssGradientAttr cssAttr
  HiLink cssPrintAttr cssAttr
  HiLink cssRubyAttr cssAttr
  HiLink cssSpeechAttr cssAttr
  HiLink cssTableAttr cssAttr
  HiLink cssTextAttr cssAttr
  HiLink cssTransformAttr cssAttr
  HiLink cssTransitionAttr cssAttr
  HiLink cssUIAttr cssAttr
  HiLink cssIEUIAttr cssAttr
  HiLink cssAuralAttr cssAttr
  HiLink cssRenderAttr cssAttr
  HiLink cssCommonAttr cssAttr

  HiLink cssPseudoClassId PreProc
  HiLink cssPseudoClassLang Constant
  HiLink cssValueLength Number
  HiLink cssValueInteger Number
  HiLink cssValueNumber Number
  HiLink cssValueAngle Number
  HiLink cssValueTime Number
  HiLink cssValueFrequency Number
  HiLink cssFunction Constant
  HiLink cssURL String
  HiLink cssFunctionName Function
  HiLink cssFunctionComma Function
  HiLink cssColor Constant
  HiLink cssIdentifier Function
  HiLink cssInclude Include
  HiLink cssIncludeKeyword atKeyword
  HiLink cssImportant Special
  HiLink cssBraces Function
  HiLink cssBraceError Error
  HiLink cssError Error
  HiLink cssUnicodeEscape Special
  HiLink cssStringQQ String
  HiLink cssStringQ String
  HiLink cssAttributeSelector String
  HiLink cssMedia atKeyword
  HiLink cssMediaType Special
  HiLink cssMediaComma Normal
  HiLink cssMediaKeyword Statement
  HiLink cssMediaProp cssProp
  HiLink cssMediaAttr cssAttr
  HiLink cssPage atKeyword
  HiLink cssPagePseudo PreProc
  HiLink cssPageMargin atKeyword
  HiLink cssPageProp cssProp
  HiLink cssKeyFrame atKeyword
  HiLink cssKeyFrameSelector Constant
  HiLink cssFontDescriptor Special
  HiLink cssFontDescriptorFunction Constant
  HiLink cssFontDescriptorProp cssProp
  HiLink cssFontDescriptorAttr cssAttr
  HiLink cssUnicodeRange Constant
  HiLink cssClassName Function
  HiLink cssClassNameDot Function
  HiLink cssProp StorageClass
  HiLink cssAttr Constant
  HiLink cssUnitDecorators Number
  HiLink cssNoise Noise
  HiLink atKeyword PreProc

  HiLink cssStringQQ String
  HiLink cssStringQ  String
  HiLink cssVar      Structure
  HiLink cssRoute    Type
  HiLink cssHsOp     Operator

  delcommand HiLink
endif

let b:current_syntax = 'cassius'

if main_syntax == 'cassius'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
