set number
syntax on

" Status bar
set statusline=
set statusline+=%#TabLineSel#
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ %l:%c

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'aserebryakov/vim-todo-lists'
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
    \ }

let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'yaml': ['yamllint'],
    \ 'go': ['gopls'],
    \ 'python': ['flake8'],
    \ }

" Linting for react
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

" Settings for syntax highlighting
highlight ALEWarning ctermfg=yellow cterm=undercurl
highlight ALEError ctermfg=red cterm=strikethrough
