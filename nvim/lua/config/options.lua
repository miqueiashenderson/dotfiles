local o = vim.o

o.number = true
o.relativenumber = false
o.signcolumn = "yes"
o.termguicolors = true
o.background = "dark"
o.showmode = false

-- Indentação
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true

-- Busca
o.ignorecase = true
o.smartcase = true

-- UX
o.mouse = "a"
o.clipboard = "unnamedplus"
o.undofile = true
o.swapfile = false
o.backup = false
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.cursorline = true
o.updatetime = 250
o.timeoutlen = 400
o.splitright = true
o.splitbelow = true
o.completeopt = "menu,menuone,noselect"

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

vim.cmd.colorscheme('tokyonight-night')
-- Alternativa: vim.cmd.colorscheme('cyberdream')

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- Tree lateral (nvim-tree) translúcida igual ao terminal
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none" })

-- Terminal: sem número de linha e já em insert mode ao abrir
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.cmd("startinsert")
    end,
})
