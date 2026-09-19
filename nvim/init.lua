vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')
Plug('romgrk/barbar.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-tree/nvim-tree.lua')
Plug('windwp/nvim-autopairs')
Plug('kylechui/nvim-surround')
Plug('lewis6991/gitsigns.nvim')
Plug('numToStr/Comment.nvim')
Plug('ibhagwan/fzf-lua')
Plug('MeanderingProgrammer/render-markdown.nvim')
Plug('scottmckendry/cyberdream.nvim')
Plug('folke/tokyonight.nvim')
Plug('numToStr/FTerm.nvim')
Plug('folke/trouble.nvim')
Plug('folke/todo-comments.nvim')
Plug('folke/which-key.nvim')
Plug('mfussenegger/nvim-jdtls')

-- Temas alternativos (descomente se quiser trocar):
-- Plug('AlexvZyl/nordic.nvim', { ['branch'] = 'main' })
-- Plug('ellisonleao/gruvbox.nvim')

Plug('folke/persistence.nvim')

-- Debug (DAP)
Plug('mfussenegger/nvim-dap')
Plug('rcarriga/nvim-dap-ui')
Plug('nvim-neotest/nvim-nio')
Plug('jay-babu/mason-nvim-dap.nvim')

-- Formatação
Plug('stevearc/conform.nvim')
Plug('mfussenegger/nvim-lint')
Plug('WhoIsSethDaniel/mason-tool-installer.nvim')

-- LSP e Autocomplete
Plug('mason-org/mason.nvim')
Plug('mason-org/mason-lspconfig.nvim')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')
Plug('rafamadriz/friendly-snippets')

vim.call('plug#end')
require("config.mappings")
require("config.options")

require("plugins.web-devicons")
require("plugins.lualine")
require("plugins.barbar")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.autopairs")
require("plugins.surround")
require("plugins.gitsigns")
require("plugins.comment")
require("plugins.fzf-lua")
require("plugins.render-markdown")
require("plugins.trouble")
require("plugins.persistence")
require("plugins.todo-comments")
require("plugins.which-key")
require("plugins.jdtls")
require("plugins.tokyonight")
require("plugins.dap")
require("plugins.cyberdream")
require("plugins.FTerm")
require("plugins.conform")
require("plugins.lint")
require("plugins.tool-installer")
require("plugins.lspconfig")
require("plugins.cmp")
