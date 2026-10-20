-- lazydev: completion da API do Neovim (vim.*) nos arquivos .lua da config
require("lazydev").setup({
    library = {
        -- tipos do luv quando aparecer "vim.uv"
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "nvim-lspconfig", words = { "lspconfig" } },
    },
})
