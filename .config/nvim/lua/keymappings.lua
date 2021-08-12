-- leader mapping
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = ' '

-- saving

vim.api.nvim_set_keymap("n", "<c-w><c-q>", ":wq<CR>", { noremap = true, silent=true })
vim.api.nvim_set_keymap("n", "<c-w><c-w>", ":w!<CR>", { noremap = true, silent=true })
vim.api.nvim_set_keymap("n", "<c-q><c-q>", ":q!<CR>", { noremap = true, silent=true })

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- I hate escape
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- buffers
vim.api.nvim_set_keymap("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bb", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ba", ":bad ", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bl", ":ls<CR>", { noremap = true, silent = true })

-- wraps
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>sw", ":set wrap<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>snw", ":set wrap<CR>", { noremap = true })

-- terminal
vim.api.nvim_set_keymap("n", "<Leader>tv", ":vne<CR>:terminal<CR>i", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>th", ":sp<CR>:terminal<CR>i", { noremap = true, silent = true })

-- substitute
vim.api.nvim_set_keymap("n", "S", ":%s//g<Left><Left>", { noremap = true })

-- git
vim.api.nvim_set_keymap("n", "<Leader>g", ":Git<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gP", ":Git push<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gp", ":Git pull<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gl", ":Git log<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gv", ":GV<CR>", { noremap = true })

-- signify
vim.api.nvim_set_keymap("n", "<Leader>st", ":SignifyToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>j", ":call sy#jump#next_hunk(v:count1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>k", ":call sy#jump#prev_hunk(v:count1)<CR>", { noremap = true, silent = true })

-- open/source lua config
vim.api.nvim_set_keymap("n", "<c-e><c-v>", ":tabnew ~/.config/nvim/init.lua<CR>", { noremap = true, silent=true })
vim.api.nvim_set_keymap("n", "<c-s><c-x>", ":source %<CR>", { noremap = true, silent = true })

-- packer
vim.api.nvim_set_keymap("n", "<c-p><c-i>", ":PackerInstall<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-p><c-d>", ":PackerClean<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-p><c-s>", ":PackerStatus<CR>", { noremap = true })

-- resize windows
vim.api.nvim_set_keymap("n", "+", "<c-W>+", { noremap = true, silent=true })
vim.api.nvim_set_keymap("n", "-", "<c-W>-", { noremap = true, silent=true })

-- copy/paste
vim.api.nvim_set_keymap("v", "<C-y>", "\"+y", { noremap = true, silent=true })
vim.api.nvim_set_keymap("n", "<c-p><c-p>", "\"+p", { silent=true })
vim.api.nvim_set_keymap("n", "Y", "y+", { noremap = true, silent=true })

-- sessions
vim.api.nvim_set_keymap("n", "<Leader>sc", ":mksession! ~/.config/nvim/sessions/", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ss", ":bufdo bwipeout | source ~/.config/nvim/sessions/", { noremap = true })

-- terraform
vim.api.nvim_set_keymap("n", "<Leader>ti", ":!source .env | terraform init -no-color<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>tp", ":!terraform plan -no-color -out=last_plan.bin > last_plan.log<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ta", ":!terraform apply -no-color last_plan.bin<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>op", ":vsplit last_plan.log<CR>", { noremap = true })

-- telescope
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap = true })
