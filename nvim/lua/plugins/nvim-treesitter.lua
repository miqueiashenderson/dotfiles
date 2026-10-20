-- nvim-treesitter na branch MAIN (rewrite p/ Neovim 0.12+):
-- a API antiga (nvim-treesitter.configs) NÃO existe mais nessa branch.
-- Requisitos: tree-sitter-cli, gcc, tar, curl.
local ts = require("nvim-treesitter")

ts.setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Parsers usados na config (era o "ensure_installed" da branch antiga).
-- Roda de forma assíncrona; já instalado é no-op.
ts.install({
    "lua",
    "python",
    "java",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "cpp",
    "bash",
    "json",
    "yaml",
    "html",
    "css",
    "javascript",
})

-- Na branch main o realce NÃO é habilitado automaticamente: precisa deste
-- autocmd. Só liga se o parser do filetype existir (senão fica regex normal).
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TsHighlight", { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
    desc = "Realce treesitter (branch main do nvim-treesitter)",
})
