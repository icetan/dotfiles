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

""" vim-scripts repos
Bundle 'ZenCoding.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
" SnipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
""" github repos
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bkad/CamelCaseMotion'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
" language support
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
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
colorscheme desert
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
set listchars=nbsp:·,tab:»·,trail:·  " Configure how invisibles appear.
set list!                             " Show invisibles.
set showcmd                           " Show partially typed command sequences.
set laststatus=2                      " Always show status bar.
set ruler                             " Show line, column and scroll info in status line.
set wrap
set linebreak
set visualbell                        " Don't beep.
set modelines=1                       " Use modeline overrides.
set scrolloff=3                       " Minimum number of lines to always show above/below the caret.
if has("gui_running")
  set guioptions=egmrt                " Hide toolbar in MacVim
endif
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

" v7.3 specific stuff
if v:version >= 703
  " Margin line
  set cc=80
  " Persistent undo
  set undofile
  set undodir=~/.vimundo " Need to create this directory for undofile to work
endif

"let g:ctrlp_working_path_mode = ''   " Disable automatic project root resolve.

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'php'],
                           \ 'passive_filetypes': ['puppet'] }

" Key mappings
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
" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'
" FuzzyFinder
let g:fuf_buffer_keyDelete = '<c-w>'
let g:fuf_bookmarkdir_keyDelete = '<c-w>'
map <C-T>t :FufFile **/<CR>
map <C-T>d :FufDir<CR>
map <C-T>b :FufBuffer<CR> 
map <C-T>o :FufBookmarkDir<CR> 
map <C-T>a :FufBookmarkDirAdd<CR>
map <C-T>r :FufRenewCache<CR>
" Syntastic
map <C-S>s :up<CR>:SyntasticCheck<CR>
map <C-S>e :up<CR>:SyntasticCheck<CR>:Errors<CR>
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy?<C-R><C-R>=substitute( escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
nnoremap <C-M> :silent %w !dr-markdown\|xargs open<CR>
