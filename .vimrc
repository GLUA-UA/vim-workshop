" Enable syntx hilight
syntax on

" Put the cursor in the beggining of the line where it was when last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set nu "rnu " line numbers

"set ignorecase		" Case insensitive matches
"set smartcase		" Only use case sensitive search when there are capital letters

set incsearch		" the search results apear as you type
" set hlsearch		" hilight search results even after the search
set mouse=a			" Enable mouse

" Auto indentation
set autoindent
set smartindent

set tabstop=4 " Number of spaces a tab occupies visually"
set shiftwidth=4 " Number of spaces for indentation alteration"
" set expandtab " converts tabs into spaces

" set wildmenu

