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
Plug('OXY2DEV/markview.nvim')
Plug('scottmckendry/cyberdream.nvim')
Plug('folke/tokyonight.nvim')
Plug('numToStr/FTerm.nvim')
Plug('folke/trouble.nvim')
Plug('folke/todo-comments.nvim')
Plug('folke/which-key.nvim')
Plug('mfussenegger/nvim-jdtls')

-- Folding + statuscolumn (roubado do jdhao/nvim-config)
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo')
Plug('luukvbaal/statuscol.nvim')

-- Text objects via treesitter (branch main, combina com o nvim-treesitter main)
Plug('nvim-treesitter/nvim-treesitter-textobjects', { ['branch'] = 'main' })

-- Quickfix, busca e progresso do LSP
Plug('kevinhwang91/nvim-bqf')
Plug('kevinhwang91/nvim-hlslens')
Plug('j-hui/fidget.nvim')

-- Navegação inteligente
Plug('dnlhc/glance.nvim')
Plug('smoka7/hop.nvim')
Plug('folke/lazydev.nvim')

-- Edição e UX
Plug('gbprod/yanky.nvim')
Plug('RRethy/vim-illuminate')
Plug('catgoose/nvim-colorizer.lua')
Plug('Bekaboo/dropbar.nvim')
Plug('nvim-mini/mini.indentscope')

-- Movimento e efeitos
Plug('karb94/neoscroll.nvim')
Plug('tris203/precognition.nvim')

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
require("config.diagnostics")
require("config.commands")

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
require("plugins.trouble")
require("plugins.persistence")
require("plugins.todo-comments")
require("plugins.which-key")
require("plugins.jdtls")
require("plugins.tokyonight")
require("plugins.dap")
require("plugins.cyberdream")
-- Markdown renderizado no buffer (deve carregar depois do colorscheme)
require("plugins.markview")
require("plugins.FTerm")
require("plugins.conform")
require("plugins.lint")
require("plugins.tool-installer")
require("plugins.lspconfig")
require("plugins.cmp")

-- == Extras (baseado no jdhao/nvim-config) ==
require("plugins.ufo")         -- statuscolumn + dobras (nvim-ufo)
require("plugins.textobjects") -- af/if, ]f, ]c, ]a via treesitter
require("plugins.bqf")         -- quickfix melhorado
require("plugins.hlslens")     -- contador de buscas (3/47)
require("plugins.fidget")      -- progresso do LSP
require("plugins.glance")      -- <space>gd/gr/gi com preview
require("plugins.hop")         -- f = pulo na tela toda
require("plugins.lazydev")     -- completion vim.* em arquivos .lua
require("plugins.yanky")       -- histórico de yank ([y/]y, <leader>p)
require("plugins.illuminate")  -- realça símbolo sob o cursor
require("plugins.colorizer")   -- #ff0000 pintado na cor real
require("plugins.dropbar")     -- winbar com caminho do arquivo
require("plugins.indentscope") -- guia de indentação
require("plugins.neoscroll")   -- scroll suave (Ctrl+d/u)
require("plugins.precognition")-- dicas de movimento em virtual text
