"NVIM CONFIGURATION FILE


call plug#begin('~/.config/nvim/bundle')

" Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'rbong/vim-crystalline'
let g:airline_theme='dark'
Plug 'vim-syntastic/syntastic'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Theme
syntax enable
set t_Co=256
set termguicolors
set background=dark
colorscheme palenight

" basics
filetype plugin indent on
syntax on set number
set modifiable
set splitbelow
set splitright
set relativenumber
set number
set incsearch
set nowrap
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set backspace=2
set expandtab
set nobackup
set noswapfile

" preferences
let mapleader = " "
nnoremap <SPACE> <Nop>
inoremap jk <ESC>
nnoremap ; :
nnoremap S :%s//g<Left><Left>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>sw :set wrap<CR>
nnoremap <leader>nsw :set nowrap<CR>
nnoremap <leader>tv :vne<CR>:terminal<CR>i
nnoremap <leader>th :sp<CR>:terminal<CR>i
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
tnoremap jk <C-\><C-n>
nmap <leader>gt :Git<CR>
nmap <leader>gC :Git commit<CR>
nmap <leader>gP :Git push<CR>
nmap <leader>gp :Git pull<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gb :Git branch<CR>
nmap <leader>gc :Git checkout
nmap <leader>st :SignifyToggle<CR>
nmap <leader>gv :GV<CR>
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)
nmap <leader>tr :!tree<CR>
nmap <silent> <c-e><c-v> :tabnew ~/.config/nvim/init.vim<CR>
nmap <silent> <c-s><c-x> :source ~/.config/nvim/init.vim<CR>
nmap <silent> <c-p><c-i> :PlugInstall<CR>
nmap <silent> <c-p><c-d> :PlugClean<CR>
nmap <silent> + <c-W>+
nmap <silent> - <c-W>-
nmap <silent> <c-w><c-t> <c-W>T
nmap <silent> <c-w><c-v> :vne<CR>
nmap <silent> <c-w><c-q> :wq<CR>
nmap <silent> <c-w><c-w> :w!<CR>
nmap <silent> <c-q><c-q> :q!<CR>
nmap <silent> <c-f><c-f> :FZF<CR>
nmap <silent> <c-b><c-b> :Buffers<CR>
nmap <silent> <c-b> 1 :bdelete 1<CR>
nmap <silent> <c-x><c-b> :!bash %<CR>gg
nmap <silent> <c-x><c-p> :!python3 %<CR>gg
nmap <silent> <c-x><c-n> :!node %<CR>gg
"nmap <silent> <c-x><c-p> :!perl %<CR>gg

" navigate split screen easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Copy/pasting
vnoremap <C-y> "+y
nmap <c-p><c-p> "+p

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
noremap Y y+

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  
set pastetoggle=<F2>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" crystalline statusbar
function! StatusLine(...)
  return crystalline#mode() . crystalline#right_mode_sep('')
        \ . ' %f%h%w%m%r ' . crystalline#right_sep('', 'Fill') . '%='
        \ . crystalline#left_sep('', 'Fill') . ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
endfunction
let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'dracula'
set laststatus=2
set tabline=%!crystalline#bufferline()
set showtabline=2

hi Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE guifg=white 

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" clean all registrers
let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
  call setreg(r, [])
endfor
