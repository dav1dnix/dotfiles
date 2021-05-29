" Configuration
set number
set hlsearch
syntax on
set background=dark
set cmdheight=2 " show full errors
set modifiable
set relativenumber
set cursorline
set laststatus=2
set noshowmode
set ignorecase

autocmd InsertLeave * write

" Keymaps
" map & nmap - recursive
" nnoremap & inoremap - non-recursive
" e.g. {
"   :map j gg
"   :map Q j
"   // j is mapped to gg and Q is also mapped to gg. This is because j will be
"   expanded for recursive mapping
"   :noremap W j
"   W mapped to j and not gg, because j will not be expanded for non-recursive
"   mapping.
" }

nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" Change name of modes
let g:currentmode = {
  \ 'i': 'INSERT',
  \ 'R': 'REPLACE',
  \ 'v': 'VISUAL',
  \ 'V': 'VISUAL LINE',
  \ 'n': 'NORMAL',
  \ 'c': 'CMD',
  \ "\<C-V>": 'VISUAL BLOCK'
  \ }

" Status Line
set statusline=
set statusline+=%#ColourMode#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=\ %#ColourMode#
" set statusline+=\ %#StatusLine#
set statusline+=\ %F
set statusline+=\ -
set statusline+=\ %{getfsize(expand(@%))}\ bytes
set statusline+=%=
set statusline+=%#ColourMode#
set statusline+=\ %m
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ ln:
set statusline+=\ %l,
set statusline+=\ cl:
set statusline+=\ %c

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
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

colorscheme OceanicNext

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

" Errors and warnings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Nerdtree
" Open nerdtree automatically when starting nvim
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l

" Make NERDTree look a bit nicer
let NERDTreeMinimalUI = 1

" Toggle opening and closing of nerdtree
map <C-n> :NERDTreeToggle<CR>

" Settings for syntax highlighting
hi ModeMsg ctermbg=Black
hi CursorLine cterm=None ctermbg=Black
hi ALEWarning ctermfg=Yellow cterm=undercurl
hi ALEError ctermfg=Red cterm=underline
hi GroupA ctermbg=White
hi Pmenu ctermbg=Black
hi StatusLine ctermfg=Grey
hi ColourMode ctermbg=Black
hi Directory ctermfg=White

match GroupA / \+$/

" listchars - https://medium.com/usevim/understanding-listchars-acb9e5a90854
" 'list' is used to visualise tabs, spaces and line endings.
" 'listchars' determines strings that will be used when list mode is active.
set list lcs=trail:.,tab:..
