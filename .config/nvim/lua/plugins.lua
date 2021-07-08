local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- use 'vim-syntastic/syntastic'
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }   
    use {
        'neovim/nvim-lsp',
        opt = true
    }
    use { 
        'neovim/nvim-lspconfig',
        opt = true
    }
    use 'drewtempelmeyer/palenight.vim'
    use 'Yggdroot/indentLine'
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    use 'neoclide/coc.nvim'
    use 'junegunn/gv.vim'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    vim.cmd('packadd nvim-lsp')
    vim.cmd('packadd nvim-lspconfig')
end)
