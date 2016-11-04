" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 May 21

" This color scheme uses a light grey background.

" First remove all existing highlighting.
"set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mine"

"hi Normal ctermfg=Black ctermbg=White  guifg=Black guibg=White

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory term=bold ctermfg=DarkBlue guifg=Blue
hi LineNr term=underline ctermfg=Brown guifg=Brown
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue guibg=White
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=White ctermfg=DarkBlue guibg=White guifg=DarkBlue
hi FoldColumn term=standout ctermbg=White ctermfg=DarkBlue guibg=White guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan

" Colors for syntax highlighting
hi Constant term=underline ctermfg=DarkRed guifg=Magenta guibg=White
hi Special term=bold ctermfg=DarkMagenta guifg=SlateBlue guibg=White
if &t_Co > 8
  hi Statement term=bold cterm=bold ctermfg=Brown gui=bold guifg=Brown
endif
hi Ignore ctermfg=Black guifg=Black


" Here is my change options.
hi Type	term=underline		ctermfg=LightGreen	guifg=#60ff60 gui=bold
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi Constant  term=underline  cterm=bold ctermfg=Red  guifg=#ffa0a0
hi Function  term=underline  cterm=bold ctermfg=magenta  guifg=Red

" syntax highlighting
"hi PreProc    term=underline cterm=NONE ctermfg=darkmagenta  gui=NONE guifg=magenta3
hi Identifier term=underline cterm=NONE ctermfg=darkcyan     gui=NONE guifg=cyan4
"hi Comment    term=NONE      cterm=NONE ctermfg=darkred      gui=NONE guifg=red2
"hi Constant   term=underline cterm=NONE ctermfg=darkgreen    gui=NONE guifg=green3
"hi Special    term=bold      cterm=NONE ctermfg=lightred     gui=NONE guifg=deeppink
hi Statement  term=bold      cterm=bold ctermfg=blue	     gui=bold guifg=blue
hi Function  term=bold      cterm=bold ctermfg=magenta	     gui=bold guifg=blue
"hi Type	      term=underline cterm=NONE ctermfg=blue	     gui=bold guifg=blue

if exists("syntax_on")
  let syntax_cmd = "enable"
  runtime syntax/syncolor.vim
  unlet syntax_cmd
endif

" vim: sw=2
