" vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin("~/.dotfiles/.vim/bundle/")
" vundle packages
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'xoria256.vim'
Plugin 'Distinguished'
Plugin 'ctrlp.vim'
Plugin 'Zoomwin'
Plugin 'scrooloose/Syntastic'
Plugin 'matchit.zip'
Plugin 'tComment'
Plugin 'aruscher/vim-sparkup-py3'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tommcdo/vim-exchange'
Plugin 'SirVer/ultisnips'
Plugin 'sickill/vim-pasta'
" Plugin 'ShowMarks'
call vundle#end()

" vim options
filetype plugin indent on
syntax on
colorscheme xoria256
" colorscheme distinguished
" colorscheme solarized
" set background=dark
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set showtabline=2
set number
set wrap
" set backspace=0
set bs=2
set t_Co=256
set colorcolumn=+1 " red line and over is error
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set textwidth=80
set hlsearch
set incsearch
set laststatus=2 " Always display the status line
set expandtab

" turn off vim markdown folding
let g:vim_markdown_folding_disabled=1

" Reduce timeout after <ESC>
set ttimeout
set ttimeoutlen=20
set notimeout

" Syntax highlighting for filetypes.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for markdown
autocmd FileType markdown setlocal spell

" Airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'light'
set t_Co=256

:set smartcase
:set ignorecase
:set noantialias

" Bufferline
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 1

" Tab completion will insert tab at beginning of line
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

" UltiSnips
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnipsEdit splits window
let g:UltiSnipsEditSplit="vertical"
