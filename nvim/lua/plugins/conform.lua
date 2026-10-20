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
    -- Formatamento AUTOMATICO no :w desligado de proposito.
    --
    -- Motivo: os formatadores acima usam estilos proprios que brigam com os
    -- globals de config/options.lua (shiftwidth=4, expandtab=true):
    --   - clang-format (estilo LLVM) indenta com 2 espacos
    --   - black falha em arquivos com tabs e espacos misturados
    --       (InconsistentUseOfTabsAndSpaces) e ai o lsp_fallback assume com
    --       outro estilo, deixando tabs e espacos alternando no mesmo arquivo
    -- Resultado: :w reescrevia a indentacao do arquivo inteiro sem voce pedir.
    --
    -- Para formatar, use <space>f (mapeado em config/lspconfig.lua:31).
    format_on_save = false,
})
