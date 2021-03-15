" Vim Code16 (color scheme)
" Temporarily to use with (max 256-color) terminal
" Originally by: https://github.com/tomasiser/vim-code-dark
" Edited by Kocotian, 2020-2021 <kocotian@kocotian.pl>

scriptencoding utf-8

" set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="code16"

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
let g:code16_term256=1
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " ctermfg=" . a:fg
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " ctermbg=" . a:bg
  endif
  if a:attr != ""
    exec "hi " . a:group . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group
  endif
endfun

" ------------------
" Color definitions:
" ------------------

" General appearance colors:
" (some of them may be unused)

let s:cdNone = 'NONE'
let s:cdFront = '15'
let s:cdBack = 'NONE'

let s:cdTabCurrentFg = '00'
let s:cdTabCurrentBg = '03'
let s:cdTabOtherFg = '07'
let s:cdTabOtherBg = '00'
let s:cdTabOutsideFg = '00'
let s:cdTabOutsideBg = '00'

let s:cdLeftDark = '235'
let s:cdLeftMid = '237'
let s:cdLeftLight = '238'

let s:cdPopupFront = '15'
let s:cdPopupBack = '00'
let s:cdPopupHighlightBlueFg = '00'
let s:cdPopupHighlightBlueBg = '04'
let s:cdPopupHighlightGray = '00'

let s:cdSplitLight = '00'
let s:cdSplitDark = '08'
let s:cdSplitThumb = '00'

let s:cdSelection = '04'
let s:cdCursorDarkDark = '235'
let s:cdCursorDark = '239'
let s:cdCursorLight = '145'
let s:cdLineNumber = '08'
let s:cdLineNumberSel = '03'

let s:cdDiffRedDark = '124'
let s:cdDiffRedLight = '160'
let s:cdDiffRedLightLight = '196'
let s:cdDiffGreenDark = '64'
let s:cdDiffGreenLight = '70'

let s:cdSearchFg = '00'
let s:cdSearchBg = '15'

" Syntax colors:

if !exists("g:code16_conservative")
    let g:code16_conservative=0
endif

let s:cdColor00 = '00'
let s:cdColor01 = '01'
let s:cdColor02 = '02'
let s:cdColor03 = '03'
let s:cdColor04 = '04'
let s:cdColor05 = '05'
let s:cdColor06 = '06'
let s:cdColor07 = '07'
let s:cdColor08 = '08'
let s:cdColor09 = '09'
let s:cdColor10 = '10'
let s:cdColor11 = '11'
let s:cdColor12 = '12'
let s:cdColor13 = '13'
let s:cdColor14 = '14'
let s:cdColor15 = '15'

" Vim editor colors
"    <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:cdFront, s:cdBack, 'none', {})
call <sid>hi('ColorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Cursor', s:cdCursorDark, s:cdCursorLight, 'none', {})
call <sid>hi('CursorLine', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('CursorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Directory', s:cdColor12, s:cdBack, 'none', {})
call <sid>hi('DiffAdd', {}, s:cdDiffGreenDark, 'none', {})
call <sid>hi('DiffChange', {}, s:cdDiffRedDark, 'none', {})
call <sid>hi('DiffDelete', {}, s:cdDiffRedLight, 'none', {})
call <sid>hi('DiffText', {}, s:cdDiffRedLight, 'none', {})
call <sid>hi('EndOfBuffer', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('ErrorMsg', s:cdColor01, s:cdBack, 'none', {})
call <sid>hi('VertSplit', s:cdSplitDark, s:cdBack, 'none', {})
call <sid>hi('Folded', s:cdLeftLight, s:cdLeftDark, 'underline', {})
call <sid>hi('FoldColumn', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('SignColumn', {}, s:cdBack, 'none', {})
call <sid>hi('IncSearch', s:cdSearchFg, s:cdSearchBg, 'none', {})
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('CursorLineNr', s:cdLineNumberSel, s:cdBack, 'none', {})
call <sid>hi('Marker', s:cdColor08, s:cdNone, 'none', {})
call <sid>hi('MatchParen', s:cdNone, s:cdCursorDark, 'none', {})
call <sid>hi('ModeMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('MoreMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('NonText', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('Pmenu', s:cdPopupFront, s:cdPopupBack, 'none', {})
call <sid>hi('PmenuSel', s:cdPopupHighlightBlueFg, s:cdPopupHighlightBlueBg, 'none', {})
call <sid>hi('PmenuSbar', {}, s:cdPopupHighlightGray, 'none', {})
call <sid>hi('PmenuThumb', {}, s:cdPopupFront, 'none', {})
call <sid>hi('Question', s:cdColor12, s:cdBack, 'none', {})
call <sid>hi('Search', s:cdSearchFg, s:cdSearchBg, 'none', {})
call <sid>hi('SpecialKey', s:cdColor12, s:cdNone, 'none', {})
call <sid>hi('SpellBad', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('SpellCap', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('SpellLocal', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('StatusLine', s:cdFront, s:cdNone, 'none', {})
call <sid>hi('StatusLineNC', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('TabLine', s:cdTabOtherFg, s:cdTabOtherBg, 'none', {})
call <sid>hi('TabLineFill', s:cdTabOutsideFg, s:cdTabOutsideBg, 'none', {})
call <sid>hi('TabLineSel', s:cdTabCurrentFg, s:cdTabCurrentBg, 'none', {})
call <sid>hi('Title', s:cdColor03, s:cdNone, 'bold', {})
call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('VisualNOS', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('WarningMsg', s:cdColor03, s:cdBack, 'none', {})
call <sid>hi('WildMenu', s:cdNone, s:cdSelection, 'none', {})

call <sid>hi('Comment', s:cdColor02, {}, 'none', {})

call <sid>hi('Constant', s:cdColor12, {}, 'bold', {})
call <sid>hi('String', s:cdColor03, {}, 'none', {})
call <sid>hi('Character', s:cdColor03, {}, 'none', {})
call <sid>hi('Number', s:cdColor10, {}, 'none', {})
call <sid>hi('Boolean', s:cdColor04, {}, 'bold', {})
call <sid>hi('Float', s:cdColor10, {}, 'none', {})

call <sid>hi('Identifier', s:cdColor14, {}, 'none', {})
call <sid>hi('Function', s:cdColor11, {}, 'none', {})

call <sid>hi('Statement', s:cdColor13, {}, 'none', {})
call <sid>hi('Conditional', s:cdColor13, {}, 'none', {})
call <sid>hi('Repeat', s:cdColor13, {}, 'none', {})
call <sid>hi('Label', s:cdColor13, {}, 'none', {})
call <sid>hi('Operator', s:cdFront, {}, 'bold', {})
call <sid>hi('Keyword', s:cdColor13, {}, 'none', {})
call <sid>hi('Exception', s:cdColor13, {}, 'none', {})

call <sid>hi('PreProc', s:cdColor13, {}, 'none', {})
call <sid>hi('Include', s:cdColor13, {}, 'none', {})
call <sid>hi('Define', s:cdColor13, {}, 'none', {})
call <sid>hi('Macro', s:cdColor13, {}, 'none', {})
call <sid>hi('PreCondit', s:cdColor13, {}, 'none', {})

call <sid>hi('Type', s:cdColor06, {}, 'none', {})
call <sid>hi('StorageClass', s:cdColor12, {}, 'none', {})
call <sid>hi('Structure', s:cdColor12, {}, 'none', {})
call <sid>hi('Typedef', s:cdColor12, {}, 'none', {})

call <sid>hi('Special', s:cdFront, {}, 'none', {})
call <sid>hi('SpecialChar', s:cdFront, {}, 'none', {})
call <sid>hi('Tag', s:cdFront, {}, 'none', {})
call <sid>hi('Delimiter', s:cdFront, {}, 'none', {})
call <sid>hi('SpecialComment', s:cdColor02, {}, 'none', {})
call <sid>hi('Debug', s:cdFront, {}, 'none', {})

call <sid>hi('Underlined', s:cdNone, {}, 'underline', {})
call <sid>hi("Conceal", s:cdFront, s:cdBack, 'none', {})

call <sid>hi('Ignore', s:cdFront, {}, 'none', {})

call <sid>hi('Error', s:cdColor01, s:cdBack, 'undercurl', {})

call <sid>hi('Todo', s:cdColor00, s:cdColor01, 'bold', {})

" Markdown:
call <sid>hi('markdownBold', s:cdColor12, {}, 'bold', {})
call <sid>hi('markdownCode', s:cdColor03, {}, 'none', {})
call <sid>hi('markdownRule', s:cdColor12, {}, 'bold', {})
call <sid>hi('markdownCodeDelimiter', s:cdColor03, {}, 'none', {})
call <sid>hi('markdownHeadingDelimiter', s:cdColor12, {}, 'none', {})
call <sid>hi('markdownFootnote', s:cdColor03, {}, 'none', {})
call <sid>hi('markdownFootnoteDefinition', s:cdColor03, {}, 'none', {})
call <sid>hi('markdownUrl', s:cdColor14, {}, 'underline', {})
call <sid>hi('markdownLinkText', s:cdColor03, {}, 'none', {})
call <sid>hi('markdownEscape', s:cdColor03, {}, 'none', {})

" JSON:
call <sid>hi('jsonKeyword', s:cdColor14, {}, 'none', {})
call <sid>hi('jsonEscape', s:cdColor03, {}, 'none', {})
call <sid>hi('jsonNull', s:cdColor12, {}, 'none', {})
call <sid>hi('jsonBoolean', s:cdColor12, {}, 'none', {})

" HTML:
call <sid>hi('htmlTag', s:cdColor08, {}, 'none', {})
call <sid>hi('htmlEndTag', s:cdColor08, {}, 'none', {})
call <sid>hi('htmlTagName', s:cdColor12, {}, 'none', {})
call <sid>hi('htmlSpecialTagName', s:cdColor12, {}, 'none', {})
call <sid>hi('htmlArg', s:cdColor14, {}, 'none', {})

" CSS:
call <sid>hi('cssBraces', s:cdFront, {}, 'none', {})
call <sid>hi('cssInclude', s:cdColor13, {}, 'none', {})
call <sid>hi('cssTagName', s:cdColor03, {}, 'none', {})
call <sid>hi('cssClassName', s:cdColor03, {}, 'none', {})
call <sid>hi('cssPseudoClass', s:cdColor03, {}, 'none', {})
call <sid>hi('cssPseudoClassId', s:cdColor03, {}, 'none', {})
call <sid>hi('cssPseudoClassLang', s:cdColor03, {}, 'none', {})
call <sid>hi('cssIdentifier', s:cdColor03, {}, 'none', {})
call <sid>hi('cssProp', s:cdColor14, {}, 'none', {})
call <sid>hi('cssDefinition', s:cdColor14, {}, 'none', {})
call <sid>hi('cssAttr', s:cdColor03, {}, 'none', {})
call <sid>hi('cssAttrRegion', s:cdColor03, {}, 'none', {})
call <sid>hi('cssColor', s:cdColor03, {}, 'none', {})
call <sid>hi('cssFunction', s:cdColor03, {}, 'none', {})
call <sid>hi('cssFunctionName', s:cdColor03, {}, 'none', {})
call <sid>hi('cssVendor', s:cdColor03, {}, 'none', {})
call <sid>hi('cssValueNumber', s:cdColor03, {}, 'none', {})
call <sid>hi('cssValueLength', s:cdColor03, {}, 'none', {})
call <sid>hi('cssUnitDecorators', s:cdColor03, {}, 'none', {})

" JavaScript:
call <sid>hi('jsVariableDef', s:cdColor14, {}, 'none', {})
call <sid>hi('jsFuncArgs', s:cdColor14, {}, 'none', {})
call <sid>hi('jsRegexpString', s:cdColor09, {}, 'none', {})
call <sid>hi('jsThis', s:cdColor12, {}, 'none', {})
call <sid>hi('jsOperatorKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('jsDestructuringBlock', s:cdColor14, {}, 'none', {})
call <sid>hi('jsObjectKey', s:cdColor14, {}, 'none', {})
call <sid>hi('jsGlobalObjects', s:cdColor06, {}, 'none', {})
call <sid>hi('jsModuleKeyword', s:cdColor14, {}, 'none', {})
call <sid>hi('jsClassDefinition', s:cdColor06, {}, 'none', {})
call <sid>hi('jsClassKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('jsExtendsKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('jsExportDefault', s:cdColor13, {}, 'none', {})
call <sid>hi('jsFuncCall', s:cdColor11, {}, 'none', {})
call <sid>hi('jsObjectValue', s:cdColor14, {}, 'none', {})
call <sid>hi('jsParen', s:cdColor14, {}, 'none', {})
call <sid>hi('jsObjectProp', s:cdColor14, {}, 'none', {})

" Typescript:
call <sid>hi('typescriptLabel', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptExceptions', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptBraces', s:cdFront, {}, 'none', {})
call <sid>hi('typescriptEndColons', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptParens', s:cdFront, {}, 'none', {})
call <sid>hi('typescriptDocTags', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptDocComment', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptLogicSymbols', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptImport', s:cdColor13, {}, 'none', {})
call <sid>hi('typescriptBOM', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptVariableDeclaration', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptVariable', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptExport', s:cdColor13, {}, 'none', {})
call <sid>hi('typescriptAliasDeclaration', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptAliasKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptClassName', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptAccessibilityModifier', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptOperator', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptArrowFunc', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptMethodAccessor', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptMember', s:cdColor11, {}, 'none', {})
call <sid>hi('typescriptTypeReference', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptDefault', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptTemplateSB', s:cdColor03, {}, 'none', {})
call <sid>hi('typescriptArrowFuncArg', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptParamImpl', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptFuncComma', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptCastKeyword', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptCall', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptCase', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptReserved', s:cdColor13, {}, 'none', {})
call <sid>hi('typescriptDefault', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptDecorator', s:cdColor11, {}, 'none', {})
call <sid>hi('typescriptPredefinedType', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptClassHeritage', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptClassExtends', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptClassKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptBlock', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptDOMDocProp', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptTemplateSubstitution', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptClassBlock', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptFuncCallArg', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptIndexExpr', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptConditionalParen', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptArray', s:cdColor11, {}, 'none', {})
call <sid>hi('typescriptES6SetProp', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptObjectLiteral', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptTypeParameter', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptEnumKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptEnum', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptLoopParen', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptParenExp', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptModule', s:cdColor14, {}, 'none', {})
call <sid>hi('typescriptAmbientDeclaration', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptModule', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptFuncTypeArrow', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptInterfaceHeritage', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptInterfaceName', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptInterfaceKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptInterfaceExtends', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptGlobal', s:cdColor06, {}, 'none', {})
call <sid>hi('typescriptAsyncFuncKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptFuncKeyword', s:cdColor12, {}, 'none', {})
call <sid>hi('typescriptGlobalMethod', s:cdColor11, {}, 'none', {})
call <sid>hi('typescriptPromiseMethod', s:cdColor11, {}, 'none', {})

" XML:
call <sid>hi('xmlTag', s:cdColor06, {}, 'none', {})
call <sid>hi('xmlTagName', s:cdColor06, {}, 'none', {})
call <sid>hi('xmlEndTag', s:cdColor06, {}, 'none', {})

" Ruby:
call <sid>hi('rubyClassNameTag', s:cdColor06, {}, 'none', {})
call <sid>hi('rubyClassName', s:cdColor06, {}, 'none', {})
call <sid>hi('rubyModuleName', s:cdColor06, {}, 'none', {})
call <sid>hi('rubyConstant', s:cdColor06, {}, 'none', {})

" Golang:
call <sid>hi('goPackage', s:cdColor12, {}, 'none', {})
call <sid>hi('goImport', s:cdColor12, {}, 'none', {})
call <sid>hi('goVar', s:cdColor12, {}, 'none', {})
call <sid>hi('goConst', s:cdColor12, {}, 'none', {})
call <sid>hi('goStatement', s:cdColor13, {}, 'none', {})
call <sid>hi('goType', s:cdColor12, {}, 'none', {})
call <sid>hi('goSignedInts', s:cdColor12, {}, 'none', {})
call <sid>hi('goUnsignedInts', s:cdColor12, {}, 'none', {})
call <sid>hi('goFloats', s:cdColor12, {}, 'none', {})
call <sid>hi('goComplexes', s:cdColor12, {}, 'none', {})
call <sid>hi('goBuiltins', s:cdColor11, {}, 'none', {})
call <sid>hi('goBoolean', s:cdColor12, {}, 'none', {})
call <sid>hi('goPredefinedIdentifiers', s:cdColor12, {}, 'none', {})
call <sid>hi('goTodo', s:cdColor02, {}, 'none', {})
call <sid>hi('goDeclaration', s:cdColor12, {}, 'none', {})
call <sid>hi('goDeclType', s:cdColor12, {}, 'none', {})
call <sid>hi('goTypeDecl', s:cdColor12, {}, 'none', {})
call <sid>hi('goTypeName', s:cdColor06, {}, 'none', {})
call <sid>hi('goVarAssign', s:cdColor14, {}, 'none', {})
call <sid>hi('goVarDefs', s:cdColor14, {}, 'none', {})
call <sid>hi('goReceiver', s:cdFront, {}, 'none', {})
call <sid>hi('goReceiverType', s:cdColor04, {}, 'none', {})
call <sid>hi('goFunctionCall', s:cdColor11, {}, 'none', {})
call <sid>hi('goMethodCall', s:cdColor11, {}, 'none', {})
call <sid>hi('goSingleDecl', s:cdColor14, {}, 'none', {})

" Python:
call <sid>hi('pythonStatement', s:cdColor12, {}, 'none', {})
call <sid>hi('pythonOperator', s:cdColor12, {}, 'none', {})
call <sid>hi('pythonException', s:cdColor13, {}, 'none', {})
call <sid>hi('pythonExClass', s:cdColor06, {}, 'none', {})
call <sid>hi('pythonBuiltinObj', s:cdColor14, {}, 'none', {})
call <sid>hi('pythonBuiltinType', s:cdColor06, {}, 'none', {})
call <sid>hi('pythonBoolean', s:cdColor12, {}, 'none', {})
call <sid>hi('pythonNone', s:cdColor12, {}, 'none', {})
call <sid>hi('pythonTodo', s:cdColor12, {}, 'none', {})
call <sid>hi('pythonClassVar', s:cdColor12, {}, 'none', {})
call <sid>hi('pythonClassDef', s:cdColor06, {}, 'none', {})

" TeX:
call <sid>hi('texStatement', s:cdColor12, {}, 'none', {})
call <sid>hi('texBeginEnd', s:cdColor11, {}, 'none', {})
call <sid>hi('texBeginEndName', s:cdColor14, {}, 'none', {})
call <sid>hi('texOption', s:cdColor14, {}, 'none', {})
call <sid>hi('texBeginEndModifier', s:cdColor14, {}, 'none', {})
call <sid>hi('texDocType', s:cdColor13, {}, 'none', {})
call <sid>hi('texDocTypeArgs', s:cdColor14, {}, 'none', {})

" Git:
call <sid>hi('gitcommitHeader', s:cdColor08, {}, 'none', {})
call <sid>hi('gitcommitOnBranch', s:cdColor08, {}, 'none', {})
call <sid>hi('gitcommitBranch', s:cdColor13, {}, 'none', {})
call <sid>hi('gitcommitComment', s:cdColor08, {}, 'none', {})
call <sid>hi('gitcommitSelectedType', s:cdColor02, {}, 'none', {})
call <sid>hi('gitcommitSelectedFile', s:cdColor02, {}, 'none', {})
call <sid>hi('gitcommitDiscardedType', s:cdColor01, {}, 'none', {})
call <sid>hi('gitcommitDiscardedFile', s:cdColor01, {}, 'none', {})
call <sid>hi('gitcommitOverflow', s:cdColor01, {}, 'none', {})
call <sid>hi('gitcommitSummary', s:cdColor13, {}, 'none', {})
call <sid>hi('gitcommitBlank', s:cdColor13, {}, 'none', {})

" Lua:
call <sid>hi('luaFuncCall', s:cdColor11, {}, 'none', {})
call <sid>hi('luaFuncArgName', s:cdColor14, {}, 'none', {})
call <sid>hi('luaFuncKeyword', s:cdColor13, {}, 'none', {})
call <sid>hi('luaLocal', s:cdColor13, {}, 'none', {})
call <sid>hi('luaBuiltIn', s:cdColor12, {}, 'none', {})

" Diff:
call <sid>hi('diffRemoved', s:cdColor01, {}, 'none', {})
call <sid>hi('diffAdded', s:cdColor02, {}, 'none', {})
call <sid>hi('diffChanged', s:cdColor03, {}, 'none', {})

call <sid>hi('diffLine', s:cdColor03, {}, 'bold', {})
call <sid>hi('diffSubname', s:cdColor03, {}, 'none', {})

call <sid>hi('diffFile', s:cdColor07, {}, 'none', {})
call <sid>hi('diffNewFile', s:cdColor07, {}, 'none', {})
call <sid>hi('diffOldFile', s:cdColor07, {}, 'none', {})
call <sid>hi('diffIndexLine', s:cdColor07, {}, 'none', {})
call <sid>hi('diffComment', s:cdColor02, {}, 'italic', {})

call <sid>hi('diffOnly', s:cdColor11, {}, 'none', {})
call <sid>hi('diffIdentical', s:cdColor11, {}, 'none', {})
call <sid>hi('diffDiffer', s:cdColor11, {}, 'none', {})
call <sid>hi('diffBDiffer', s:cdColor11, {}, 'none', {})
call <sid>hi('diffIsA', s:cdColor11, {}, 'none', {})
call <sid>hi('diffNoEOL', s:cdColor11, {}, 'none', {})
call <sid>hi('diffCommon', s:cdColor11, {}, 'none', {})

" Vimwiki:
call <sid>hi('VimwikiHeader1', s:cdColor01, s:cdNone, 'bold', {})
call <sid>hi('VimwikiHeader2', s:cdColor03, s:cdNone, 'bold', {})
call <sid>hi('VimwikiHeader3', s:cdColor02, s:cdNone, 'bold', {})
call <sid>hi('VimwikiHeader4', s:cdColor04, s:cdNone, 'bold', {})
call <sid>hi('VimwikiHeader5', s:cdColor05, s:cdNone, 'bold', {})
call <sid>hi('VimwikiHeader6', s:cdColor06, s:cdNone, 'bold', {})

call <sid>hi('VimwikiRedText', s:cdColor01, s:cdNone, 'bold', {})
call <sid>hi('VimwikiGreenText', s:cdColor02, s:cdNone, 'bold', {})
call <sid>hi('VimwikiYellowText', s:cdColor03, s:cdNone, 'bold', {})
call <sid>hi('VimwikiBlueText', s:cdColor04, s:cdNone, 'bold', {})
call <sid>hi('VimwikiMagentaText', s:cdColor05, s:cdNone, 'bold', {})
call <sid>hi('VimwikiCyanText', s:cdColor06, s:cdNone, 'bold', {})

call <sid>hi('VimwikiLRedText', s:cdColor09, s:cdNone, 'bold', {})
call <sid>hi('VimwikiLGreenText', s:cdColor10, s:cdNone, 'bold', {})
call <sid>hi('VimwikiLYellowText', s:cdColor11, s:cdNone, 'bold', {})
call <sid>hi('VimwikiLBlueText', s:cdColor12, s:cdNone, 'bold', {})
call <sid>hi('VimwikiLMagentaText', s:cdColor13, s:cdNone, 'bold', {})
call <sid>hi('VimwikiLCyanText', s:cdColor14, s:cdNone, 'bold', {})

" Dired:
call <sid>hi('DiredRead', s:cdColor09, s:cdNone, 'bold', {})
call <sid>hi('DiredWrite', s:cdColor10, s:cdNone, 'bold', {})
call <sid>hi('DiredExecute', s:cdColor11, s:cdNone, 'bold', {})
call <sid>hi('DiredRoot', s:cdColor01, s:cdNone, 'bold', {})
call <sid>hi('DiredUser', s:cdColor15, s:cdNone, 'bold', {})
call <sid>hi('DiredGroup', s:cdColor15, s:cdNone, 'bold', {})
call <sid>hi('DiredModifyDate', s:cdColor14, s:cdNone, 'none', {})
