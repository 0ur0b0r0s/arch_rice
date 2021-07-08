require("plugins")
require("keymappings")
require("settings")
require("lualine-conf")
require("compe-conf")

require'lspconfig'.terraformls.setup{}
require'lspconfig'.bashls.setup{}     
-- vim.cmd('source ./lua/completion-conf.vim')
