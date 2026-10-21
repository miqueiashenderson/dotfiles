local ok, cyberdream = pcall(require, "cyberdream")
if not ok then return end

cyberdream.setup({
    -- Ativa o fundo transparente para a foto do seu terminal aparecer
    transparent = true,

    -- Deixa o texto em itálico nos comentários (opcional, fica bem bonito)
    italic_comments = true,

    -- Esconde a cor de fundo nas janelas flutuantes (como as do Telescope/Fzf e do LSP)
    hide_fillchars = true,

    -- Roxo mais claro: `purple` alimenta Operator (+ - == :), Type (int/str),
    -- @type.builtin (blend do purple), markdown H4, match do cmp etc.
    -- Contraste vs fundo sobe de 5.3:1 p/ 9.6:1 (texto seu = 12.3:1).
    colors = {
        purple = "#d6adff",
        -- alternativas (troque e rode ZR):
        -- purple = "#cf9dff", -- mais roxo, contraste 8.4:1
        -- purple = "#dab8ff", -- mais claro ainda, contraste 10.4:1
    },
})

-- Aplica o tema (carrega cedo no init.lua, antes da lualine/barbar,
-- para que o theme = 'auto' da lualine use a paleta cyberdream)
vim.cmd.colorscheme("cyberdream")

-- Garante a transparência em alguns buffers especiais (árvore de arquivos, etc.)
for _, g in ipairs({ "Normal", "NormalFloat", "NormalNC", "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeWinSeparator" }) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
end
