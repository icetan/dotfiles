set nocompatible               " be iMproved

""" Vundle setup start
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" if you havent downloaded Vundle already:
" $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Status line
Bundle 'bling/vim-airline'

" Zen
Bundle 'mattn/emmet-vim'

" .lvimrc files for project local editor settings
Bundle 'embear/vim-localvimrc'
"Bundle 'cd-hook'

" Fuzzy Finder
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'icetan/vim-fuf-fast'
Bundle 'icetan/vim-fuf-ignore'

" SnipMate
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'bkad/CamelCaseMotion'
Bundle 'danro/rename.vim'

" language support
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'

Bundle 'ZeusTheTrueGod/vim-format-js'

" linters
Bundle 'Shutnik/jshint2.vim'

" color schemes
Bundle 'altercation/vim-colors-solarized'

""" non github repos
"ex. Bundle 'git://git.wincent.com/command-t.git'
" ...


" required!
filetype plugin indent on
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
""" Vundle end

""" My settings
syntax on
set background=dark
let g:solarized_visibility="low"
colorscheme solarized
" UTF-8
scriptencoding utf-8
set encoding=utf-8
set nobomb
" Buffers
set hidden
" Search
set gdefault                          " Global search by default (/g turns it off).
set hlsearch                          " Highlight results.
set incsearch                         " Search-as-you-type.
set ignorecase                        " Case-insensitive…
set smartcase                         " …unless phrase includes uppercase.
" UI
set fillchars=vert:\                  " No pipes in vertical split separators.
set listchars=nbsp:·,extends:»,tab:▸·,trail:·
set list!                             " Show invisibles.
set showcmd                           " Show partially typed command sequences.
set laststatus=2                      " Always show status bar.
set ruler                             " Show line, column and scroll info in status line.
set wrap
set linebreak
set visualbell                        " Don't beep.
set modelines=1                       " Use modeline overrides.
set scrolloff=3                       " Minimum number of lines to always show above/below the caret.
" Editing
set backspace=indent,eol,start        " Allow backspacing over everything in insert mode.
set nojoinspaces                      " 1 space, not 2, when joining sentences.
" Auto indenting
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
" Remove backup files
set nobackup
set noswapfile
set nowritebackup
" Always forward slashes
set shellslash
" Save editor state to ~/.viminfo
set viminfo=%,!,'50,\"100,:100,n~/.viminfo
" Use mouse in terminal
set mouse=a

" Airline config
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = '▲'
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.whitespace = '●'

let g:airline#extensions#hunks#non_zero_only = 1

" Add current work dir to status line
"function! AirlineInit()
"  let g:airline_section_c = airline#section#create_left(['%{split(getcwd(), "/")[-1]}', 'file'])
"endfunction
"autocmd VimEnter * call AirlineInit()

if has("gui_running")
  set guioptions=egmrt                " Hide toolbar in MacVim
  set guifont=Menlo:h11
endif

" v7.3 specific stuff
if v:version >= 703
  " Margin line
  set cc=80
  " Persistent undo
  set undofile
  set undodir=~/.vimundo " Need to create this directory for undofile to work
endif

" OS exceptions
if has("win32")
  set shell=sh.exe
  set shellcmdflag=--login\ -ic
  set shellxquote=\"
endif

"let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': ['ruby', 'php'],
"                           \ 'passive_filetypes': ['puppet'] }

" Key mappings
let mapleader = ","
set pastetoggle=<F4>
map <F3> :let @/ = ""<CR>
map <C-W>d :bp\|bd #<CR>
map <C-W>n :vert new<CR>
" Make Y consistent with C and D - yank to end of line, not full line.
nnoremap Y y$
" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" CtrlP
"map <C-T>f :CtrlPCurFile<CR>
"map <C-T>d :CtrlPDir<CR>
"map <C-T>b :CtrlPBuffer<CR>
"map <C-T>o :CtrlPBookmarkDir<CR>
"map <C-T>a :CtrlPBookmarkDirAdd<CR>
"map <C-T>r :CtrlPClearAllCaches<CR>
"map <C-T>t :CtrlPBufTag<CR>
"map <C-T>T :CtrlPBufTagAll<CR>

" FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|class|jpeg|jpg|gif|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

let g:fuf_buffer_keyDelete = '<c-w>'
let g:fuf_bookmarkdir_keyDelete = '<c-w>'
map <C-P>  :FufFast<CR>
map <C-T>t :FufFast<CR>
map <C-T>d :FufDir<CR>
map <C-T>b :FufBuffer<CR>
map <C-T>o :FufBookmarkDir<CR>
map <C-T>a :FufBookmarkDirAdd<CR>
map <C-T>r :FufIgnoreUpdate<CR>

"autocmd User chdir FufIgnoreUpdate   " Depends on cd-hook
call fuf#ignore#Update()

" Syntastic
"map <C-S>s :up<CR>:SyntasticCheck<CR>
"map <C-S>e :up<CR>:SyntasticCheck<CR>:Errors<CR>

nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>
cnoremap <F1> JSHint

" Set sign column color to same as line numbers
hi! link SignColumn LineNr

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy?<C-R><C-R>=substitute( escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>

nnoremap <leader>m :silent %w !dr-markdown\|xargs open<CR>

" Fugitive and diff key mappings
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap d2 :diffget //2 \| diffup<CR>
nnoremap d3 :diffget //3 \| diffup<CR>
nnoremap du :diffup<CR>

" Autocommands
au BufRead,BufNewFile *.coffeete set ft=html
au BufRead,BufNewFile *.ino set ft=cpp

let g:localvimrc_persistent = 1
