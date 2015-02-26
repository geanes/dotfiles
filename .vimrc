execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp/ctrlp.vim
syntax on
filetype plugin indent on
set number
set laststatus=2 " Always disply the status line

" Reduce timeout after <ESC>
set ttimeout
set ttimeoutlen=20
set notimeout

set nocompatible " Use vim settings rather than vi settings
set incsearch
set hlsearch

" Fuzzy finder ignore stuff that can't be opened and tmps
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;tmp/**"

" For text files, set text width to 80 characters
autocmd FileType text setlocal textwidth=80

" When editing a file, jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler.
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Syntax highlighting for filetypes.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for markdown
autocmd FileType markdown setlocal spell

" Wrap 80 characters for markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Soft tabs 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'wombat'
set t_Co=256

:set smartcase
:set ignorecase
:set noantialias

" Color scheme
colorscheme distinguished
set background=dark
set encoding=utf-8

" Numbers
set number
set numberwidth=5

" Tab completion will insert tab aat beginning of line
" will use completion if not at beginning.
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
