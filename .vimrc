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

" vim-scripts repos
Bundle 'vim-coffee-script'
Bundle 'ZenCoding.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'snipMate'
Bundle 'Markdown'
" github repos
Bundle 'scrooloose/syntastic'
" non github repos ex.
"Bundle 'git://git.wincent.com/command-t.git'
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
colorscheme desert
set hidden
set hlsearch
set ignorecase
set smartcase
" Word wrap
set wrap
set linebreak
" Auto indenting
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
" Remove backup files
set nobackup
set noswapfile
set nowritebackup
" Remove UTF-8 BOM
set nobomb

" v7.3 specific stuff
if v:version >= 703
  " Margin line
  set cc=80
  " Persistent undo
  set undofile
  set undodir=~/.vimundo " Need to create this directory for undofile to work
endif

" Key mappings
set pastetoggle=<F4>
let g:user_zen_expandabbr_key = '<c-e>'
let g:fuf_buffer_keyDelete = '<c-w>'
let g:fuf_bookmarkdir_keyDelete = '<c-w>'
map <C-T>t :FufFile **/<CR>
map <C-T>d :FufDir<CR>
map <C-T>b :FufBuffer<CR> 
map <C-T>o :FufBookmarkDir<CR> 
map <C-T>a :FufBookmarkDirAdd<CR>
map <C-T>r :FufRenewCache<CR>
map <F3> :let @/ = ""<CR>
map <C-W>d :bd<CR>

" Hide toolbar in MacVim
if has("gui_running")
  set guioptions=egmrt
endif
