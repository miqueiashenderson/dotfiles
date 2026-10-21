-- Kanagawa: só configura o tema; NÃO aplica na carga (o ativo é cyberdream).
-- Ative com: :Tema kanagawa  (ou troque o require de tema no init.lua)
local ok, kanagawa = pcall(require, "kanagawa")
if not ok then return end

kanagawa.setup({
    transparent = true,  -- fundo translúcido, igual ao cyberdream
    undercurl = true,
    terminalColors = true,
})
