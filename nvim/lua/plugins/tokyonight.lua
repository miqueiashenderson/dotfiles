local ok, tokyonight = pcall(require, "tokyonight")
if not ok then return end

tokyonight.setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
    },
})

-- NÃO aplica mais o tema na carga (o ativo é cyberdream, no init.lua).
-- As opções acima continuam valendo quando você usa: :Tema tokyonight-night
-- vim.cmd.colorscheme("tokyonight-night")
-- for _, g in ipairs({ "Normal", "NormalFloat", "NormalNC", "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeWinSeparator" }) do
--     vim.api.nvim_set_hl(0, g, { bg = "none" })
-- end
