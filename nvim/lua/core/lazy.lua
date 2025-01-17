local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "rose-pine/neovim", name = "rose-pine" },
  'AlexvZyl/nordic.nvim',
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  { "catppuccin/nvim",  name = "catppuccin" },
  "lunarvim/darkplus.nvim",
  "onsails/lspkind.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "folke/which-key.nvim",
  { "akinsho/toggleterm.nvim", version = "*",    config = true },
  "neovim/nvim-lspconfig",
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  "MunifTanjim/prettier.nvim",
  {
    "xixiaofinland/sf.nvim",
    commit = "2246197c46d3b16139e00aa26e14fe43966ab561",
    config = function()
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          require("sf.org").fetch()
        end,
      })
    end,
  },
  "ThePrimeagen/harpoon",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  "lewis6991/gitsigns.nvim",
  "tpope/vim-commentary",
  { "zbirenbaum/copilot.lua",  cmd = "Copilot",  event = "InsertEnter" },
  { "L3MON4D3/LuaSnip",        version = "v2.*", build = "make install_jsregexp" },
  "hiphish/rainbow-delimiters.nvim",
  "tpope/vim-surround",
  "rust-lang/rust.vim",
  "folke/todo-comments.nvim",
  "vimwiki/vimwiki",
  "mattn/emmet-vim",
  "dcampos/cmp-emmet-vim",
  "ThePrimeagen/vim-be-good",
  { -- Autoformat
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 1500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        apex = { { "prettierd", "prettier" } },
      },
    },
  },
})
