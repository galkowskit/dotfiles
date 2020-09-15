call plug#begin('~/local/share/nvim/plugged')
Plug 'tpope/vim-surround'
call plug#end()

if !exists('g:vscode')
call plug#begin('~/local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'editorconfig/editorconfig-vim'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'peitalin/vim-jsx-typescript'

Plug 'arzg/vim-colors-xcode'

call plug#end()

" Basic settings
language en_GB
syntax on

let mapleader = ','
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number relativenumber
set termguicolors

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set scrolloff=5

colorscheme xcodedarkhc

" - fzf
nnoremap <leader>p :GFiles<CR>
nnoremap <C-f> :Rg

" - coc
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" - coc - NeoVim status bar support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_fuction','')}

" close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" - coc
" - coc - Go to x commands.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gy <Plug>(coc-type-references)

" - coc - Navigate through diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" - coc - Rename symbol.
nmap <silent> <leader>rn <Plug>(coc-rename)

" - coc - Bring up coc suggestions.
inoremap <silent><expr> <c-space> coc#refresh()

" - coc - Apply codeaction.
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" - coc - Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" - coc - Prettier formatting.
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 OrganiseImports :call CocAction('runCommand', 'editor.action.organizeImport')

" - coc - Fix current.
nmap <leader>qf <Plug>(coc-fix-current)

endif
