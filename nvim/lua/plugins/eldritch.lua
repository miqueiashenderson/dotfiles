-- eldritch: só configura (ative com :Tema eldritch)
-- variantes: eldritch, eldritch-dark, eldritch-minimal
local ok, eldritch = pcall(require, "eldritch")
if not ok then return end

eldritch.setup({
    transparent = true, -- fundo translúcido, igual ao cyberdream
    terminal_colors = true,
})
