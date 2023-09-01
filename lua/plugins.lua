
-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- My Plugins -------------------------- 
    use 'jiangmiao/auto-pairs'  -- auto-complete matching brackets
    use 'https://github.com/tpope/vim-commentary' -- For Commenting gcc & gc
    use 'http://github.com/tpope/vim-surround' -- Surrounding ysw)
    use 'https://github.com/ap/vim-css-color' -- CSS Color Preview
    use 'christoomey/vim-tmux-navigator' -- For vim tmux navigation

    use "lukas-reineke/indent-blankline.nvim" --indent


    -- colorschemes
    use "rafi/awesome-vim-colorschemes"
    use "lunarvim/colorschemes"
    use "lunarvim/darkplus.nvim" -- color schemes

    -- lua line 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
 
    -- use 'https://github.com/terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors
    use 'https://github.com/vim-airline/vim-airline' -- Status bar
    -- use 'https://github.com/preservim/tagbar' -- Tagbar for code navigation
    -- use 'yggdroot/indentline' --Show indent lines (useful for loops)


    -- cmp plugins
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use "saadparwaiz1/cmp_luasnip"                          -- snippet completions


    -- mason
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}


    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
    use 'nvim-lua/completion-nvim' 

    
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            {
            'nvim-lua/plenary.nvim',
            'sharkdp/fd',
            } 
        }
}
    use { 'nvim-telescope/telescope-media-files.nvim' }


    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    }

    -- nvim-tree
    use{ "nvim-tree/nvim-tree.lua" }
    -- vs-code like icons
    use{ "nvim-tree/nvim-web-devicons" }

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- ufo for code folding
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}


    -- :TODO 
    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------
  
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

