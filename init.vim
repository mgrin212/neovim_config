set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"
set shell=/usr/local/bin/fish
"
call plug#begin()
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'Mofiqul/vscode.nvim'
Plug 'akinsho/toggleterm.nvim'
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'lervag/vimtex'
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'dense-analysis/ale'
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'beeender/Comrade'
Plug 'sirver/ultisnips'
call plug#end()

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:coq_settings = { 'auto_start': v:true }
let g:airline_powerline_fonts = 1

set nu
set rnu


let g:vscode_style = "dark"
colorscheme dracula

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

let g:loaded_clipboard_provider = 1


:nmap <space>e <Cmd>CHADopen<CR>




inoremap {<Cr> <Esc>:call AutoBracketDrop()<Cr>a

function! AutoBracketDrop()
  if col('.') == col('$') - 1
    substitute /\s*$//
    exec "normal! A\<Cr>{\<Cr>X\<Cr>}\<Esc>k$x"
  else
    exec "normal! a{\<Cr>\<Esc>"
  endif
endfunction


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

