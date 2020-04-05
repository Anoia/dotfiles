syntax enable 

" tabs + spaces
set tabstop=4
set softtabstop=4
set expandtab

" Remove trailing white spaces.
autocmd BufWritePre * %s/\s\+$//e

" UI
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set laststatus=2

