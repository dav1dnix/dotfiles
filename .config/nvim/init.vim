" Configuration
set number
set hlsearch
syntax on
set background=dark
set cmdheight=2 " show full errors
set modifiable

" Status Line
set statusline=
set statusline+=%#TabLineSel#
set statusline+=\ %F
set statusline+=\ %{getfsize(expand(@%))}\ bytes
set statusline+=%=
set statusline+=\ %m
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'aserebryakov/vim-todo-lists'
Plug 'alvan/vim-closetag'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Plugin config
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1

" ALE
let g:ale_fixers = {
    \ 'javascript': ['prettier'],
    \ 'typescript': ['prettier'],
    \ 'css': ['prettier'],
    \ 'html': ['prettier'],
    \ 'yaml': ['prettier'],
    \ 'go': ['goimports'],
    \ 'rust': ['rustfmt'],
    \ }

let g:ale_linters = {
    \ 'javascript': ['tsserver'],
    \ 'typescript': ['tsserver'],
    \ 'yaml': ['yamllint'],
    \ 'go': ['gopls'],
    \ 'python': ['flake8'],
    \ 'zig': ['zls'],
    \ 'rust': ['rls'],
    \ }

" Linting for react
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

" vim-closetag
let g:closetag_filenames = '*.html'
let g:closetag_filetypes = 'html'

" Nerdtree
" Open nerdtree automatically when starting nvim
autocmd vimenter * NERDTree

" Toggle opening and closing of nerdtree
map <C-n> :NERDTreeToggle<CR>

" Settings for syntax highlighting
highlight ALEWarning ctermfg=yellow cterm=undercurl
highlight ALEError ctermfg=red cterm=underline
highlight GroupA ctermbg=black
match GroupA / \+$/

" listchars - https://medium.com/usevim/understanding-listchars-acb9e5a90854
" 'list' is used to visualise tabs, spaces and line endings.
" 'listchars' determines strings that will be used when list mode is active.
set list lcs=trail:.,tab:..
