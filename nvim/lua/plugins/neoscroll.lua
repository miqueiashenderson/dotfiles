-- Scroll suave com animação: Ctrl+d/u, Ctrl+f/b, zt/zz/zb
local ns = require("neoscroll")

ns.setup({
    mappings = {}, -- usamos keymaps próprios (abaixo) pra controlar easing
    easing = "quadratic",
    hide_cursor = true,       -- esconde o cursor durante a animação
    respect_scrolloff = true, -- respeita o scrolloff (8) no fim da animação
})

local keymap = {
    ["<C-u>"] = function() ns.ctrl_u({ duration = 250, easing = "sine" }) end,
    ["<C-d>"] = function() ns.ctrl_d({ duration = 250, easing = "sine" }) end,
    ["<C-b>"] = function() ns.ctrl_b({ duration = 450 }) end,
    ["<C-f>"] = function() ns.ctrl_f({ duration = 450 }) end,
    ["zt"]    = function() ns.zt({ half_win_duration = 250 }) end,
    ["zz"]    = function() ns.zz({ half_win_duration = 250 }) end,
    ["zb"]    = function() ns.zb({ half_win_duration = 250 }) end,
}
for key, fn in pairs(keymap) do
    vim.keymap.set({ "n", "x" }, key, fn, { desc = "Scroll suave: " .. key })
end
