-- poimandres: só configura (ative com :Tema poimandres)
local ok, poimandres = pcall(require, "poimandres")
if not ok then return end

poimandres.setup({
    -- dark_variant = "main",   -- "main" (padrão) ou "storm"
    -- groups = { headings = "blue1" },  -- cor dos títulos no markdown
})
