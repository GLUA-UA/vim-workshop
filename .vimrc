" Enable syntx hilight
syntax on

" Disable vi compatibility for better experience
set nocompatible

" Put the cursor in the beggining of the line where it was when last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set nu "rnu " line numbers

"set ignorecase		" Case insensitive matches
"set smartcase		" Only use case sensitive search when there are capital letters

set incsearch		" the search results apear as you type
" set hlsearch		" hilight search results even after the search

" Auto indentation
set autoindent
set smartindent

set tabstop=4 " Number of spaces a tab occupies visually
set shiftwidth=4 " Number of spaces for indentation alteration
" set expandtab " converts tabs into spaces

" set wildmenu

set cursorline		" Hilight the current line
" set cursorcolumn	" Hilight the current line

set mouse=a			" Enable mouse
set clipboard=unnamedplus " Use the system clipboard

let mapleader = " "

" move selected lines down (visual mode)
xnoremap J :move '>+1<CR>gv=gv
" move selected lines up (visual mode)
xnoremap K :move '<-2<CR>gv=gv

" Replace word under cursor
vnoremap <leader>rs :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>ra :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>rc :%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>

" Clear highlights
augroup SearchHighlight
    autocmd!
    autocmd CmdlineLeave /,\? :nnoremap <buffer> <Esc> :nohls<CR>
    autocmd CmdlineChanged /,\? :nnoremap <buffer> <Esc> :nohls<CR>
augroup END
