set nocompatible
filetype on

"相对行数
set relativenumber

set foldenable      " 允许折叠  
"代码折叠 
set foldmarker={{{,}}}
set fdm=marker

set ignorecase

set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"鼠标点击
set mouse=v
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'


filetype plugin indent on     " required!
set cindent shiftwidth=4

" NERDTree config
map nd :NERDTree 
map nc :NERDTreeClose
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&  b:NERDTreeType == "primary") | q | endif

"other config
set nu

let mapleader = ","
let g:mapleader = ","
" vsp resize
nmap ( :vertical resize -2<CR>
nmap ) :vertical resize +2<CR>

"easymotion
let g:EasyMotion_leader_key = '<Leader>'

"powerline config

set laststatus=2
set t_Co=256
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

"设置主题
set background=dark 
colorscheme molokai

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
"高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
set nowrap

" 设置状态栏主题风格Powerline
let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on

"自动缩进
set autoindent
set cindent
"将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让 vim把连续数量的空格视为一个制表符
set softtabstop=4
set smarttab

"括号匹配
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap ' ''<LEFT>
"inoremap " ""<LEFT>
""inoremap ` ``<LEFT>

set list
"set listchars=tab:▸-,eol:↩︎,trail:-
set listchars=tab:\ \ ,eol:↩︎
set backspace=indent,eol,start
