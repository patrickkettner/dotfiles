" auto syntax higlighting, file based indention, and file detection plugins
filetype plugin indent on

if isdirectory(expand("~/.vim/bundle/vundle/"))
  " load vundle if it is installed
  so ~/.vim/load_vundle.vim
else
  " otherwise automatically install it
  autocmd VimEnter * so ~/.vim/setup_vundle.vim
endif

" be iMproved
set nocompatible
filetype off

let mapleader = ","                          " , is easier to reach than /

cmap ~? ~/                                    " I only type ~? on accident

noremap <F1> <Esc>                           " If I want help, i'll type help

nnoremap Y y$                                " Make Y consistent with C and D.
nnoremap <silent> <Leader>u :GundoToggle<CR> " Toggle the undo tree
nnoremap + <C-a>                             " increment digits with +
nnoremap - <C-x>                             " decrement digits with +
nnoremap <silent> <Leader>w :call <SID>StripTrailingWhitespaces()<CR>

map <leader>qq :cclose<CR>                   " Close Quickfix window (,qq)
map <C-k> <C-W>k                             " Move to a split above
map <C-j> <C-W>j                             " Move to a split below
map <C-H> <C-W>h                             " Move to a split right
map <C-L> <C-W>l                             " Move to a split left

set expandtab                             " Use spaces, rather than literal tabs
set tabstop=2                             " Number of spaces a tab is equal to
set shiftwidth=2                          " sets width of tab during retabing
set softtabstop=2                         " tabstop specifically for insert mode


set autoindent                            " Copy indent from current line
                                          " "when starting a new line
set backspace=indent,eol,start            " make backspace work properly
set colorcolumn=81                        " Highlight certain columns
set complete-=i                           " removes included files from the
                                          " completeion list, speeding it up
set cpoptions+=$                          " put a '$' at the end of changed text
set gdefault                              " defaults to global replacement
set hidden                                " allows for unsaved buffers
set history=9999                          " store last 9999 commands in history
set ignorecase                            " during a search, that is
set laststatus=2                          " always show status line
set lazyredraw                            " prevents screen from redraw during
                                          " macros, registers etc
set lcs=tab:▸\ ,trail:·,nbsp:_            " Show 'invisible' characters
set list listchars=tab:→\ ,trail:▸        " show tabs and trailing spaces
set nobackup                              " do not write backup files
set nomore                                " hide the --More-- thing
set nonumber                              " remove line numvers on the left
set nostartofline                         " Don’t reset cursor to start of line
                                          " when moving around when
set noswapfile                            " don't write swap files
set nrformats-=octal                      " dont incrementing octal numbers
set pastetoggle=<Leader>p                 " toggle paste mode with F2
set shell=/bin/zsh                        " set the shell var for ! commands
set shiftround                            " jump to the nearest tabstop or
                                          " shiftwidth when indenting a line
set shortmess=a                           " skip 'hit enter to continue' message
set showcmd                               " shows command in bottom left
set smartcase                             " ignore ignorecase if there is any
                                          " capitilization at all
set showmatch                             " when the cursor is over a bracket,
                                          " highlight the matching one
set smarttab
set splitbelow                            " makes the default split go below,
                                          " rather than above current window
set splitright                            " makes a vsplit open to the right
set title                                 " set terms title to file name
set ttyfast                               " Enable fast terminal connection
set undolevels=99999                      " allows for 9999 edits to be saved in the undo tree
set virtualedit+=block                    " go beyond the end of the line and
                                          " when in visual block mode.
set wildmenu                              " Enhance command-line completion
set wildmode=longest,list,full

" save undo data between vim sessions
if has("persistent_undo")
  silent !mkdir -vp ~/.backup/vim/undo/ > /dev/null 2>&1
  set backupdir=~/.backup/vim,.
  set directory=~/.backup/vim,~/tmp,.
  set undofile
  set undodir=~/.backup/vim/undo/,~/tmp,.
endif

" For a nice, huuuuuge viminfo file
if has("viminfo")
  set viminfo='100,f1,:100,/100,n$HOME/.vim/.viminfo
endif


" highlight , non breaking spaces, whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
  highlight SignColumn ctermbg=none
endif

if has("user_commands")
  syntax enable
  let g:solarized_termcolors=256
  let g:solarized_termtrans = 1

  try
    " wrap the colorscheme in a try catch in
    " case vundle isn't loaded on first run
    colorscheme solarized
  catch
  endtry
  set background=dark
endif

if has("autocmd")
  "syntax highlighting for various files
  au BufNewFile,BufRead *.handlebars set ft=handlebars
  au BufNewFile,BufRead *.styl       set ft=stylus
  au BufNewFile,BufRead *.less       set ft=less
  au BufNewFile,BufRead *.scss       set ft=scss.css
  au BufNewFile,BufRead *.less       set ft=less.css

  " automatically reload vimrc when it's saved
  au BufWritePost .vimrc so ~/.vimrc

  " highlight current line
  au WinLeave * set nocursorline nocursorcolumn
  au WinEnter * set cursorline cursorcolumn
  set cursorline cursorcolumn"

  " Add omnicompletion to CSS
  au FileType css set omnifunc=csscomplete#CompleteCSS
endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
