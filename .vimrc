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

" My Bundles here:
Bundle 'vim-coffee-script'
Bundle 'ZenCoding.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'snipMate'
" non github repos
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
colorscheme delek
set hidden
set hlsearch
set ignorecase
set smartcase
" Margin line
set cc=80
" Auto indenting
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
" Remove backup files
set nobackup
set noswapfile
set nowritebackup

" Key mappings
let g:user_zen_expandabbr_key = '<c-e>'
let g:fuf_buffer_keyDelete = '<c-w>'
let g:fuf_bookmarkdir_keyDelete = '<c-w>'
map <C-T>t :FufFile **/<CR>
map <C-T>d :FufDir<CR>
map <C-T>b :FufBuffer<CR> 
map <C-T>o :FufBookmarkDir<CR> 
map <C-T>a :FufBookmarkDirAdd<CR>
map <F3> :let @/ = ""<CR>
map <C-W>d :bd<CR>
