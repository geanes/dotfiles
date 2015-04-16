set nocompatible

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin("~/.dotfiles/.vim/bundle/")
" essential
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
" utilities
Plugin 'tpope/vim-surround'
Plugin 'tommcdo/vim-exchange'
Plugin 'SirVer/ultisnips'
Plugin 'tComment'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
" Plugin 'bootleq/ShowMarks'
Plugin 'jacquesbh/vim-showmarks'
" colors themes interface
Plugin 'bling/vim-airline'
" Plugin 'bling/vim-bufferline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'xoria256.vim'
Plugin 'Distinguished'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'altercation/vim-colors-solarized'
" syntax
Plugin 'scrooloose/Syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/fountain.vim'
" Plugin 'vim-scripts/fountainwiki.vim'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'tristen/vim-sparkup'
Plugin 'sickill/vim-pasta'
" other
Plugin 'ervandew/supertab'
Plugin 'ctrlp.vim'
Plugin 'Zoomwin'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
" tmux
Plugin 'benmills/vimux'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()

" COLOR SCHEME
" colorscheme twilight256
" colorscheme xoria256
colorscheme Tomorrow-Night-Eighties
" colorscheme distinguished
" colorscheme solarized
" set background=dark

" AIRLINE
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
" BUFFERLINE
" let g:bufferline_active_buffer_left = '['
" let g:bufferline_active_buffer_right = ']'
" let g:bufferline_modified = '+'
" let g:bufferline_show_bufnr = 1

" VIM OPTIONS
" set macmeta
filetype plugin indent on
syntax on
set mouse=a
set scrolloff=999
set encoding=utf-8
set updatetime=300
set autoindent
set showmode
" set showcmd
set backspace=indent,eol,start
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set title
set linebreak
set synmaxcol=800
set completeopt=longest,menuone,preview
" let showmarks_enable=0
" let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_marks="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" let g:showmarks_textlower="\t>"
" let g:showmarks_textupuppper="\t>"
" tabs spaces and wrapping
set tabstop=2
set shiftwidth=2
set showtabline=2
set textwidth=80
set wrap
set number
set bs=2
set t_Co=256
set colorcolumn=+1 " red line and over is error
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set hlsearch
set incsearch
set laststatus=2 " Always display the status line
set expandtab
" set ttyfast
" Reduce timeout after <ESC>
set ttimeout
set ttimeoutlen=10
set notimeout
" code folding
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
" turn off vim markdown folding
let g:vim_markdown_folding_disabled=1
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

" SYNTAX
" Syntax highlighting for filetypes.
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md set shiftwidth=4
autocmd BufNewFile,BufRead *.md set tabstop=4
autocmd BufNewFile,BufRead *.md set textwidth=0
autocmd BufNewFile,BufRead *.fountain set filetype=fountain
autocmd BufNewFile,BufRead *.fountain set shiftwidth=4
autocmd BufNewFile,BufRead *.fountain set tabstop=4
autocmd BufNewFile,BufRead *.fountain set textwidth=0
" Enable spellchecking for markdown and fountain
autocmd FileType markdown setlocal spell
autocmd FileType fountain setlocal spell

" UltiSnips
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnipsEdit splits window
let g:UltiSnipsEditSplit="vertical"

" MAPPINGS
" set a map leader
let mapleader = ','
let g:mapleader = ','
let maplocalleader='\\'
" remap arrow keys
no <up> ddkP
no <down> ddp
no <left> za
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> za
vno <right> <Nop>
vno <up> <Nop>
" better jk
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" map redo
nmap <leader>u <C-r>
" S for split lines
nnoremap S i<CR><ESC>
" wrap toggle
nnoremap <leader>W :set wrap!<CR>
" auto center
nmap <leader>s :set scrolloff=0<CR>
nmap <leader>S :set scrolloff=999<CR>
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
" create newlines in normal mode
nmap gO O<ESC>j
nmap g<C-O> o<ESC>k
" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
" upper or lowercase current word
nmap g^ gUiW
nmap gv guiW
" visual select line excluding indentation
nnoremap vv ^vg_
" zip character to end of line
nnoremap zl :let @z=@"<CR>x$p:let @"=@z<CR>
" insert mode completion
inoremap <C-f> <C-x><C-f>
inoremap <C-]> <C-x><C-]>
inoremap <C-l> <C-x><C-l>
" use standard regexes
nnoremap / /\v
vnoremap / /\v
" NERDTree
nmap <silent> <right> :NERDTreeToggle<CR>
" remove extra whitespace
nmap <leader><space> :%s/\s\+$<CR>
" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<CR>
" showmarks
nmap <silent> <leader>m :DoShowMarks<CR>
nmap <silent> <leader>M :NoShowMarks<CR>
nmap <silent> <leader>gm :4PreviewMarks<CR>
" textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>
" enable . command in visual mode
vnoremap . :normal .<CR>
" winmoves
nmap <silent> <leader>h :call WinMove('h')<CR>
nmap <silent> <leader>j :call WinMove('j')<CR>
nmap <silent> <leader>k :call WinMove('k')<CR>
nmap <silent> <leader>l :call WinMove('l')<CR>
nmap <leader>wc :wincmd q<CR>
" toggle cursorline
nnoremap <leader>i :set cursorline!<CR>
" visual mode */#
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><C-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><C-o>

" FUNCTIONS
" WinMove
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" VSetSearch
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" Make vim return to the same line when you open a file
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END
