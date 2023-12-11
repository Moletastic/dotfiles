local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost moon/plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" }  -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-tree/nvim-web-devicons" }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  -- use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
  use { "folke/which-key.nvim" }
  use { "folke/trouble.nvim" }
  use {
    "folke/todo-comments.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("todo-comments").setup()
    end,
  }

  -- Colorschemes
  use { "CrispyBaccoon/gruvboxed" }
  use { "sainnhe/gruvbox-material" }
  use { "mhartington/oceanic-next" }
  use { "Shatur/neovim-ayu" }
  use {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
      }
    end
  }
  use 'AlexvZyl/nordic.nvim'
  use 'savq/melange-nvim'

  -- css
  use { "brenoprata10/nvim-highlight-colors" }

  -- Cmp
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }      -- buffer completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-path" }        -- path completions
  use { "hrsh7th/nvim-cmp" }        -- The completion plugin

  -- Snippets
  use { "L3MON4D3/LuaSnip" }             --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig" }          -- enable LSP
  use { "williamboman/mason.nvim" }        -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  -- use "MunifTanjim/prettier.nvim"

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter"
  }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  use "f-person/git-blame.nvim"

  -- Bookmarks
  use {
    "tomasky/bookmarks.nvim"
  }

  -- Tagbar
  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup({
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end
    }) end
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  use {
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  }

  use { "nvim-neorg/neorg-telescope" }

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
  }

  use { "klen/nvim-test" }

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use "mxsdev/nvim-dap-vscode-js"
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
