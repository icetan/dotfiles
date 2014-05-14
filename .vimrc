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

" Asynchronous commands yay!
Bundle 'pydave/AsyncCommand'

" Status line
Bundle 'bling/vim-airline'

" Zen
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-surround'

" .lvimrc files for project local editor settings
Bundle 'embear/vim-localvimrc'
"Bundle 'cd-hook'

" Fuzzy Finder
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'icetan/vim-fuf-fast'
"Bundle 'icetan/vim-fuf-ignore'
Bundle 'kien/ctrlp.vim'

" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'
Bundle 'icetan/gitignore'

" Movement
Bundle 'jayflo/vim-skip'

"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'bkad/CamelCaseMotion'
Bundle 'danro/rename.vim'

" language support
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'
Bundle 'derekwyatt/vim-scala'

Bundle 'ZeusTheTrueGod/vim-format-js'

" linters
Bundle 'walm/jshint.vim'

" color schemes
Bundle 'icetan/vim-colors-solarized'

"Bundle 'MultipleSearch'

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

if has("gui_running")
  set guioptions=egmrt                " Hide toolbar in MacVim
  set guifont=Menlo:h11
endif

set background=dark
colorscheme solarized

hi SignColumn ctermbg=8
"hi link LineHighlight ErrorMsg
" Set sign column color to same as line numbers
hi! link SignColumn LineNr

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
set cursorline
set fillchars=vert:\                  " No pipes in vertical split separators.
set listchars=nbsp:·,extends:»,tab:▸·,trail:·
set list!                             " Show invisibles.
set showcmd                           " Show partially typed command sequences.
set laststatus=2                      " Always show status bar.
set ruler                             " Show line, column and scroll info in status line.
set wrap                              " Wrap lines.
set linebreak
set showbreak=↵                       " Line wrap char.
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
" Don't print stuff from shell
set shellpipe=2>&1>
" Save editor state to ~/.viminfo
set viminfo=%,!,'50,\"100,:100,n~/.viminfo
" Use mouse in terminal
set mouse=a
set mousemodel=extend
" Files to ignore
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

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

" Clear highlights
map <F3> :noh<CR>:match<CR>

" Close current buffer
map <C-W>d :bp\|bd #<CR>

" Create an empty buffer in verical split window
map <C-W>n :vert new<CR>

" Simplified window navigation
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-l> <C-W>l

" Make Y consistent with C and D - yank to end of line, not full line.
nnoremap Y y$

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" CtrlP
let g:ctrlp_show_hidden = 1

" CtrlP mappings
map <C-T>f :CtrlPCurFile<CR>
map <C-T>m :CtrlPMRUFiles<CR>
map <C-T>d :CtrlPDir<CR>
map <C-T>b :CtrlPBuffer<CR>
map <C-T>o :CtrlPBookmarkDir<CR>
map <C-T>a :CtrlPBookmarkDirAdd<CR>
map <C-T>r :CtrlPClearCache<CR>
map <C-T>t :CtrlPBufTag<CR>

"let s:auto_since = {}
"function AutoCtrlPClearCacheFunc()
"  if has('unix')
"    let cwd_ = getcwd()
"    let curtime = strftime('%s')
"    if !has_key(s:auto_since, cwd_) || !empty(system('find ' . cwd_ . ' -type d -ctime -' . (curtime - s:auto_since[cwd_]) . 's'))
"      let s:auto_since[cwd_] = curtime
"      exe 'CtrlPClearCache'
"    endif
"  " TODO: Windows support
"  "elseif s:OS ==# 'win'
"  "  return 'dir ' . a:dir
"  endif
"endfunction
"command AutoCtrlPClearCache call AutoCtrlPClearCacheFunc() | exe 'CtrlP'
"let g:ctrlp_cmd = 'AutoCtrlPClearCache'

" FuzzyFinder
"let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|class|jpeg|jpg|gif|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
"
"let g:fuf_buffer_keyDelete = '<c-w>'
"let g:fuf_bookmarkdir_keyDelete = '<c-w>'
"map <C-P>  :FufFast<CR>
"map <C-T>t :FufFast<CR>
"map <C-T>d :FufDir<CR>
"map <C-T>b :FufBuffer<CR>
"map <C-T>o :FufBookmarkDir<CR>
"map <C-T>a :FufBookmarkDirAdd<CR>
"map <C-T>r :FufIgnoreUpdate<CR>

"autocmd User chdir FufIgnoreUpdate   " Depends on cd-hook
"call fuf#ignore#Update()

" Syntastic
"map <C-S>s :up<CR>:SyntasticCheck<CR>
"map <C-S>e :up<CR>:SyntasticCheck<CR>:Errors<CR>

nnoremap <silent><leader>l :JSHint<CR>

" Highlight selected text (visual mode), forwards and `#` only higlights
" witouth jumping.
nnoremap <silent># :let @/='\<'.expand('<cword>').'\>'<CR>
vnoremap <silent>* :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent># :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy:let @/=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>gV:call setreg('"', old_reg, old_regtype)<CR>
"vnoremap <silent> # :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy?<C-R><C-R>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
"nnoremap <silent> ¨ :let @/='\<'.expand('<cword>').'\>'<CR>

" TODO: Add multiple higlights
"nnoremap <silent><leader>m :execute 'SearchBuffers ' . getreg('/')<CR>:let @/=''<CR>
"nnoremap <silent><leader>c :SearchBuffersReset<CR>:let @/=''<CR>

nnoremap <silent><leader>c :cc<CR>
nnoremap <silent><leader>n :cn<CR>
nnoremap <silent><leader>p :cp<CR>
nnoremap <silent><leader>N :cnf<CR>
nnoremap <silent><leader>P :cpf<CR>

" ,l will highlight the current line
"command HighlightLine execute 'match LineHighlight /\%'.line('.').'l/'
"nnoremap <silent> <leader>l ml:HighlightLine<CR>

function! QuickFixPreview()
  if &buftype ==# 'quickfix'
    exe "normal \<CR>"
    "exe "HighlightLine"
    wincmd p
  endif
endfunction

" Pressing spacebar in quickfix window will preview and not move the cursor to
" the target line
nnoremap <silent><Space> :call QuickFixPreview()<CR>

"nnoremap <leader>m :silent %w !dr-markdown\|xargs open<CR>

" Fugitive and diff key mappings
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gW :Gwrite!<CR>
nnoremap <leader>gR :Gread!<CR>
nnoremap d2 :diffget //2 \| diffup<CR>
nnoremap d3 :diffget //3 \| diffup<CR>
nnoremap du :diffup<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Autocommands
au BufRead,BufNewFile *.coffeete set ft=html
au BufRead,BufNewFile *.ino set ft=cpp

" Nicer grep
function! GrepFunc(...)
  let exfiles = split(&wildignore, ',')
  let exdirs = map(filter(copy(exfiles), "v:val=~'\\/\\*\\?$'"), "substitute(v:val, '^\\*\\/\\|\\/\\*\\?$', '', 'g')")
  call filter(exfiles, "v:val!~'\\/\\*\\?$'")
  let args_ = '-I '
  if len(exfiles) | let args_ .= '--exclude={'.join(exfiles, ',').'} ' | endif
  if len(exdirs) | let args_ .= '--exclude-dir={'.join(exdirs,',').'} ' | endif
  let args_ .= join(a:000, ' ')
  if (empty(v:servername))
    exe 'silent! grep! ' . args_
    copen
  else
    exe 'AsyncGrep ' . args_
    echo 'Greping...'
  endif
endfunction

function! GreprSelection()
  call GrepFunc('-R "'.substitute(substitute(@/, '^\\<', '\\b', ''), '\\>$', '\\b', '').'" .')
endfunction

command -nargs=+ Grep   call GrepFunc(<f-args>)
command -nargs=+ Grepi  execute 'Grep -i <args>'
command -nargs=+ Grepr  execute 'Grep -R <args>'
command -nargs=+ Grepir execute 'Grep -iR <args>'
nnoremap <silent><leader>f :call GreprSelection()<CR>

let g:localvimrc_persistent = 1

" Add global git ignore to wildignore
autocmd VimEnter * WildignoreFromGitignore ~ .gitignore_global
