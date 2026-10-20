local ok, cyberdream = pcall(require, "cyberdream")
if not ok then return end

cyberdream.setup({
    -- Ativa o fundo transparente para a foto do seu terminal aparecer
    transparent = true,

    -- Deixa o texto em itálico nos comentários (opcional, fica bem bonito)
    italic_comments = true,

    -- Esconde a cor de fundo nas janelas flutuantes (como as do Telescope/Fzf e do LSP)
    hide_fillchars = true,
})

-- Aplica o tema (carrega depois do tokyonight para ter prioridade)
vim.cmd.colorscheme("cyberdream")

-- Garante a transparência em alguns buffers especiais (árvore de arquivos, etc.)
for _, g in ipairs({ "Normal", "NormalFloat", "NormalNC", "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeWinSeparator" }) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
end
