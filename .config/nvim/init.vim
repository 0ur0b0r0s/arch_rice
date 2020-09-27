"NVIM CONFIGURATION FILE

call plug#begin('~/.config/nvim/bundle')

" Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tomasr/molokai'
Plug 'zchee/deoplete-jedi'
Plug 'rbong/vim-crystalline'
let g:airline_theme='dark'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'yegappan/mru'
Plug 'tpope/vim-surround'
call plug#end()

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
set emoji

" preferences
let mapleader = " "
nnoremap <SPACE> <Nop>
inoremap jk <ESC>
nnoremap ; :
nnoremap S :%s//g<Left><Left>
nnoremap m1 :normal! d2jf:d$jdd<CR>
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>ba :bad 
nnoremap <leader>bn :bNext<CR>
nnoremap <leader>bb :bprevious<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>
nnoremap <leader>s1 :split #1<CR>
nnoremap <leader>s2 :split #2<CR>
nnoremap <leader>s3 :split #3<CR>
nnoremap <leader>s4 :split #4<CR>
nnoremap <leader>s5 :split #5<CR>
nnoremap <leader>s6 :split #6<CR>
nnoremap <leader>s7 :split #7<CR>
nnoremap <leader>s8 :split #8<CR>
nnoremap <leader>s9 :split #9<CR>
nnoremap <leader>vs1 :vsplit #1<CR>
nnoremap <leader>vs2 :vsplit #2<CR>
nnoremap <leader>vs3 :vsplit #3<CR>
nnoremap <leader>vs4 :vsplit #4<CR>
nnoremap <leader>vs5 :vsplit #5<CR>
nnoremap <leader>vs6 :vsplit #6<CR>
nnoremap <leader>vs7 :vsplit #7<CR>
nnoremap <leader>vs8 :vsplit #8<CR>
nnoremap <leader>vs9 :vsplit #9<CR>
nnoremap <leader>sw :set wrap<CR>
nnoremap <leader>nsw :set nowrap<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>tv :vne<CR>:terminal<CR>i
nnoremap <leader>th :sp<CR>:terminal<CR>i
tnoremap jk <C-\><C-n>
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
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Theme
syntax enable
set t_Co=256
set termguicolors
set background=dark
"colorscheme darkblue
colorscheme onedark

function! StatusLine(...)
  return crystalline#mode() . crystalline#right_mode_sep('')
        \ . ' %f%h%w%m%r ' . crystalline#right_sep('', 'Fill') . '%='
        \ . crystalline#left_sep('', 'Fill') . ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
endfunction
let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'onedark'
set laststatus=2
set tabline=%!crystalline#bufferline()
set showtabline=2

hi Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE guifg=white 

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
