" Name:         gedit
" Description:  Light background colorscheme based on gedit classic.
" Author:       James Vandersluis
" Website:      https://github.com/jvsluis/gedit-nvim-theme
" License:      MIT
" Last Change:  2025 May 19

set background=light

" hi clear
source $VIMRUNTIME/colors/vim.lua " Nvim: revert to Vim default color scheme
let g:colors_name = 'gedit'

let s:t_Co = &t_Co

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#ffffff', '#0000ff', '#00cd00', '#cd00cd', '#008b8b', '#0000ff', '#ff1493', '#bcbcbc', '#ee0000', '#0000ff', '#00cd00', '#cd00cd', '#008b8b', '#0000ff', '#ff1493', '#000000']
  " Nvim uses g:terminal_color_{0-15} instead
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif

" Gedit palette
let s:white           = { "gui": "#FFFFFF", "cterm": "232" }
let s:black           = { "gui": "#000000", "cterm": "232" }
let s:blue            = { "gui": "#0000FF", "cterm": "232" }
let s:magenta         = { "gui": "#FF00FF", "cterm": "232" }
let s:violet          = { "gui": "#6A5ACD", "cterm": "232" }
let s:cyan            = { "gui": "#008A8C", "cterm": "232" }
let s:green           = { "gui": "#2E8B57", "cterm": "232" }
let s:bordeaux        = { "gui": "#A52A2A", "cterm": "232" }
let s:red             = { "gui": "#FF0000", "cterm": "232" }
let s:yellow          = { "gui": "#FFFF00", "cterm": "232" }
let s:purple          = { "gui": "#A020F0", "cterm": "232" }
let s:grey            = { "gui": "#dddddd", "cterm": "232" }
let s:none            = { "gui": "NONE", "cterm": "232" }

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" Link different groups
hi! link Terminal Normal
hi! link PopupSelected PmenuSel
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link ErrorMsg Error
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo

" Setup the colours
call s:h("Normal",            {"bg": s:white, "fg": s:black })
call s:h("EndOfBuffer",       {"bg": s:white, "fg": s:black })
call s:h("StatusLine",        {"bg": s:white, "fg": s:black })
call s:h("StatusLineNC",      {"bg": s:white, "fg": s:black })
call s:h("StatusLineTerm",    {"bg": s:white, "fg": s:black })
call s:h("StatusLineTermNC",  {"bg": s:white, "fg": s:black })

call s:h("Keyword",           {"bg": s:none, "fg": s:cyan })
call s:h("Comment",           {"bg": s:none, "fg": s:blue })
call s:h("Constant",          {"bg": s:none, "fg": s:black })
call s:h("Identifier",        {"bg": s:none, "fg": s:black })
call s:h("Statement",         {"bg": s:none, "fg": s:bordeaux })
call s:h("PreProc",           {"bg": s:none, "fg": s:purple })
call s:h("Type",              {"bg": s:none, "fg": s:cyan })
call s:h("Special",           {"bg": s:none, "fg": s:bordeaux })
call s:h("Delimiter",         {"bg": s:none, "fg": s:black })
call s:h("Directory",         {"bg": s:none, "fg": s:blue })
call s:h("Label",             {"bg": s:none, "fg": s:black })

call s:h("Character",         {"bg": s:none, "fg": s:green })
call s:h("Number",            {"bg": s:none, "fg": s:green })
call s:h("Boolean",           {"bg": s:none, "fg": s:green })
call s:h("Float",             {"bg": s:none, "fg": s:green })
call s:h("String",            {"bg": s:none, "fg": s:magenta })
call s:h("SpecialChar",       {"bg": s:none, "fg": s:magenta })

call s:h("LineNr",            {"bg": s:none, "fg": s:black })
call s:h("Pmenu",             {"bg": s:grey, "fg": s:black })

" Inheriting these colours from the default delek theme for now
hi VertSplit guifg=#e4e4e4 guibg=#00008b gui=NONE cterm=NONE

hi PmenuSel guifg=#ffffff guibg=#00008b gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#008b8b gui=NONE cterm=NONE
hi PmenuMatch guifg=#cd00cd guibg=#add8e6 gui=NONE cterm=NONE
hi PmenuMatchSel guifg=#ff87ff guibg=#00008b gui=NONE cterm=NONE
hi TabLine guifg=#000000 guibg=#e4e4e4 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#bcbcbc gui=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#ffffff gui=bold cterm=bold
hi ToolbarLine guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
hi ToolbarButton guifg=#ffffff guibg=#bcbcbc gui=bold cterm=bold
hi NonText guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#00008b guibg=#e4e4e4 gui=NONE cterm=NONE
hi Visual guifg=#000000 guibg=#d0d0d0 gui=NONE cterm=NONE
hi VisualNOS guifg=NONE guibg=#ee0000 gui=NONE cterm=NONE

hi FoldColumn guifg=#00008b guibg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
hi CursorLineNr guifg=#a52a2a guibg=NONE gui=bold cterm=bold
hi QuickFixLine guifg=#ffffff guibg=#008b8b gui=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined guifg=#6a5acd guibg=NONE gui=underline cterm=underline
hi Error guifg=#ff0000 guibg=#ffffff gui=reverse cterm=reverse
hi WarningMsg guifg=#cd00cd guibg=#ffffff gui=NONE cterm=NONE
hi MoreMsg guifg=#000000 guibg=#ffffff gui=bold cterm=bold
hi ModeMsg guifg=#000000 guibg=#ffffff gui=bold cterm=bold
hi Question guifg=#008700 guibg=NONE gui=bold cterm=bold
hi Todo guifg=#000000 guibg=#ffff00 gui=NONE cterm=NONE
hi MatchParen guifg=#ffffff guibg=#ff1493 gui=NONE cterm=NONE
hi Search guifg=#ffffff guibg=#cd00cd gui=NONE cterm=NONE
hi IncSearch guifg=#00cd00 guibg=NONE gui=reverse cterm=reverse
hi WildMenu guifg=#00008b guibg=#ffd700 gui=bold cterm=bold
hi ColorColumn guifg=#000000 guibg=#e4e4e4 gui=NONE cterm=NONE
hi Cursor guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE
hi lCursor guifg=#000000 guibg=#00cd00 gui=NONE cterm=NONE
hi SpellBad guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl cterm=underline
hi SpellCap guifg=#008b8b guibg=NONE guisp=#008b8b gui=undercurl cterm=underline
hi SpellLocal guifg=#0000ff guibg=NONE guisp=#0000ff gui=undercurl cterm=underline
hi SpellRare guifg=#cd00cd guibg=NONE guisp=#cd00cd gui=undercurl cterm=underline
hi debugBreakpoint guifg=#ffff00 guibg=#0000ff gui=NONE cterm=NONE
hi debugPC guifg=#ff1493 guibg=#0000ff gui=NONE cterm=NONE

hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Title guifg=#cd00cd guibg=NONE gui=bold cterm=bold
hi CursorLine guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
hi DiffAdd guifg=#ffffff guibg=#5f875f gui=NONE cterm=NONE
hi DiffChange guifg=#ffffff guibg=#5f87af gui=NONE cterm=NONE
hi DiffText guifg=#000000 guibg=#c6c6c6 gui=NONE cterm=NONE
hi DiffDelete guifg=#ffffff guibg=#af5faf gui=NONE cterm=NONE

hi GitSignsAdd guifg=#32CD32
hi GitSignsChange guifg=Blue
hi GitSignsDelete guifg=Red