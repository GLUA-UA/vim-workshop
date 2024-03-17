" Enable syntax hilight
syntax on

" Disable vi compatibility for better experience
set nocompatible

" Fix backspace WHEN NOT USING `$HOME/.vimrc`
" By default vim's backspace does not behave as intended, distribution
" maintainers fix it by adding this line to `defaults.vim`
" This should not be an issue in ubuntu when using the default vimrc location
" See https://stackoverflow.com/a/11560415
set backspace=indent,eol,start

" Make vim update more often
set updatetime=100

" Put the cursor in the beggining of the line where it was when last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set nu "rnu " line numbers

"set ignorecase		" Case insensitive matches
"set smartcase		" Only use case sensitive search when there are capital letters

set incsearch		" the search results appear as you type
" set hlsearch		" highlight search results even after the search

" Auto indentation
set autoindent
set smartindent

set tabstop=4 " Number of spaces a tab occupies visually
set shiftwidth=4 " Number of spaces for indentation alteration
" set expandtab " converts tabs into spaces

set wildmenu " show all available options for a command

" set cursorline		" Hilight the current line
" set cursorcolumn	" Hilight the current column
" set colorcolumn=80	" Show a line at the 80th column

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

" ===============================
" Plugins
" ===============================

" Initialize vim-plug, leave neovim support for easier potential neovim migrations
" On first run, use `:PlugInstall` to install the plugins, and from time to
" time `:PlugUpdate` and `:PlugUpgrade` to update all the plugins and vim-plug
" itself, respectively
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" https://github.com/prabirshrestha/vim-lsp
" LSP support
Plug 'prabirshrestha/vim-lsp'

" https://github.com/mattn/vim-lsp-settings
" Easier setup of the LSPs
Plug 'mattn/vim-lsp-settings'

" https://github.com/preservim/nerdtree
" To show the file tree
Plug 'preservim/nerdtree'

" https://github.com/SirVer/ultisnips
" Snippet support
Plug 'SirVer/ultisnips'

" https://github.com/honza/vim-snippets
" Actual snippets
Plug 'honza/vim-snippets'

" https://github.com/neoclide/coc.nvim
" Code completion
" Requires NodeJS and npm
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" https://github.com/joshdick/onedark.vim
" One Dark theme
Plug 'joshdick/onedark.vim'

" https://www.nordtheme.com/docs/ports/vim/installation 
" Nord theme
Plug 'arcticicestudio/nord-vim'

" https://github.com/airblade/vim-gitgutter
" Git integration
Plug 'airblade/vim-gitgutter'

" https://github.com/github/copilot.vim
" GitHub Copilot integration
" Requires vim >= 9.0.0185, which is neither available in the Ubuntu repositories nor in snap
" To setup it up, just install it with PlugInstall and then run :Copilot setup
" Plug 'github/copilot.vim'

call plug#end()

" ===============================
" NerdTree 
" ===============================

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Toggle NerdTree
inoremap <C-t> <ESC>:NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" ===============================
" Ultisnips
" ===============================

" Some mappings for navigating the snippet
let g:UltiSnipsExpandTrigger="<tab>"		" Tab to expand the snippet
let g:UltiSnipsJumpForwardTrigger="<C-b>"	" Ctrl+B to move to the next field in the snippet
let g:UltiSnipsJumpBackwardTrigger="<C-z>"	" Ctrl+Z to move to the previous fiend in the snippet

" ===============================
" Color Schemes
" ===============================

" https://stackoverflow.com/a/64763678
" Fix for background colors not updating on the nord theme
set termguicolors

" See https://vimcolorschemes.com/
"colorscheme onedark
"colorscheme nord
