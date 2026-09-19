local ok, conform = pcall(require, "conform")
if not ok then return end
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        java = { "google-java-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        sh = { "shfmt" },
    },
    -- Formata ao salvar (com fallback para o LSP se o formatador não estiver instalado)
    format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
    },
})
