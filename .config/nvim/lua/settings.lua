local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd

cmd [[
        silent! colorscheme palenight
        autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight LineNr guibg=NONE guifg=white 
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab

    ]]
cmd('')

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.tabstop = 4
o.softtabstop = 0
o.shiftwidth = 4
o.expandtab = true
o.hlsearch = false
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false
bo.swapfile = false
bo.autoindent = true
bo.smartindent = true
