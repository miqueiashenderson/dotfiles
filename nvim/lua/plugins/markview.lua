-- markview.nvim — renderiza Markdown (e outros formatos) direto no buffer
-- Substitui o render-markdown.nvim
require("markview").setup({
    preview = {
        enable = true,                       -- preview automático
        filetypes = { "md", "rmd", "quarto" },
        hybrid_modes = { "n" },              -- mantém o render ao editar
    },
    -- Renderização básica do Markdown
    markdown = {
        enable = true,
    },
    markdown_inline = {
        enable = true,
    },
})