" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
	syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
    filetype plugin indent on
"endif

"colorscheme koehler


"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
"set showmatch      " Show matching brackets.
"set ignorecase     " Do case insensitive matching
set smartcase       " Do smart case matching
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next,:make and so on
"set hidden             " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)
set nu
set tabstop=4
set softtabstop=4
" set shiftwidth=4
set expandtab           " use whitespace instead of tab
"set noexpandtab
set autoindent
set smartindent
set cindent shiftwidth=4
" set autoindent shiftwidth=4
set foldmethod=indent
set backspace=indent,eol,start
"show tab as >---
set list
set listchars=tab:>-,trail:- "show tab and space of the end of line
"highlight when searching
set hls

"set for omnicppcomplete
filetype plugin indent on
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2     " search namespaces in the current buffer   and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set nocp
filetype plugin on
map <C-F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"set tags=tags; ";不可省略，表示若当前目录中不存在tags， 则在父目录中寻找
" stl (for C++)
set tags+=~/.vim/tags/tags
" standard library(/usr/include)
set tags+=~/.vim/tags/systags

"set for cctree
map <C-F12> :CCTreeLoadXRefDB /home/wangpq/program/svn-codes/swift_trunk_modules/cctree.out<CR>
let g:CCTreeKeyTraceForwardTree = '>'
let g:CCTreeKeyTraceReverseTree = '<'

"set for csope
map <C-F11> :!cscope -b -R <CR>

"to make content of windows-file show correctly
let &termencoding=&encoding
set encoding=utf-8
"set fileencoding=utf-8
"set fileencoding=gbk
set fileencodings=utf-8,gbk

"insert system time
"nnoremap <F5> "=strftime("%F %T")"<CR>gP
"inoremap <F5> <C-R>=strftime("%F %T")<CR>

"share clipboard
set clipboard=unnamedplus
"show status
set laststatus=2

"taglist 
map <C-F10> <ESC>:TlistToggle <CR> 
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1

"switch window
"nnoremap <c-h> <c-w>h
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-l> <c-w>l

" ===== brace autocompletion =========
""inoremap ( ()<Esc>i
""inoremap [ []<Esc>i
""inoremap { {<CR>}<Esc>O
""autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
""inoremap ) <c-r>=ClosePair(')')<CR>
""inoremap ] <c-r>=ClosePair(']')<CR>
""inoremap } <c-r>=CloseBracket()<CR>
""inoremap " <c-r>=QuoteDelim('"')<CR>
""inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		"Escaping out of the string
		return "\<Right>"
	else
		"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

"see content of registers
map <c-x> <ESC>:reg<CR>
map <c-y> <ESC>:let @+=expand('%')<CR>

"file path, work path, and system path
set path=.,,/usr/include

"delete remain blank in one line; besides, replace tab with 4 spaces
map <s-b>  <ESC>:1,$s/\s\+$//g<CR>:1,$s/\t/    /g<CR>


"use SHIFT not CTRL
map <S-f> <c-f>
map <S-u> <c-u>

"resize window
nnoremap <c-h> <c-w>>
nnoremap <c-l> <c-w><
"nnoremap <c-b> <c-w>-
nnoremap <c-k> <c-w>+

set runtimepath+=$HOME/.vim/L9-1.1
set runtimepath+=$HOME/.vim/AutoComplPop-2.14.1
"set runtimepath of plugin jedi-vim
set runtimepath+=$HOME/.vim/jedi-vim

" delete ^M
map <s-r>  <ESC>:1,$s/\r/\r/g<CR>

"statusline
set statusline=
set statusline+=%8*\ %=\ %l/%L(%p%%)\               "光标所在行号/总行数 (百分比)
set statusline+=%9*\ %c\                            "光标所在列
