return require('packer').startup(function()
    use 'wbthomason/packer.nvim' 
    use "EdenEast/nightfox.nvim"
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use "terrortylor/nvim-comment"
    use 'nvim-lualine/lualine.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "nvim-treesitter/nvim-treesitter"
    use 'p00f/nvim-ts-rainbow'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
       requires = {'nvim-lua/plenary.nvim'}}
    -- use 'saadparwaiz1/cmp-luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use 'p00f/clangd_extensions.nvim'
    use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
    use 'folke/tokyonight.nvim'
    use { 'mhartington/formatter.nvim' }
    use "jose-elias-alvarez/null-ls.nvim"    
    use "nvim-lua/plenary.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "luochen1990/rainbow"
    use "sunjon/shade.nvim"
    use 'numToStr/Comment.nvim'
    use "akinsho/toggleterm.nvim"
    use 'goolord/alpha-nvim'
    use 'lervag/vimtex'
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use 'kazhala/close-buffers.nvim'
    --------------rust sectiion-------------
    use 'simrat39/rust-tools.nvim'
    ----------------------------------------
    use 'github/copilot.vim'
    use 'chentoast/marks.nvim'

    -- Debugging
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-jdtls"
    use "leoluz/nvim-dap-go"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"





end)
