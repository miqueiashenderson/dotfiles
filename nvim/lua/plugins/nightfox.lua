-- nightfox: só configura (ative com :Tema carbonfox)
-- variantes do nightfox: carbonfox, nightfox, duskfox, terafox, dayfox...
local ok, nightfox = pcall(require, "nightfox")
if not ok then return end

nightfox.setup({
    options = {
        transparent = true,     -- fundo translúcido, igual ao cyberdream
        terminal_colors = true,
        styles = {
            comments = "italic",
        },
    },
})
