-- hop.nvim: `f` vira um pulo pra QUALQUER lugar da tela (não só a linha)
-- Pra voltar ao f normal: remova o keymap abaixo (padrão do Vim: f{char} na linha).
local hop = require("hop")

hop.setup({
    case_insensitive = true,
    quit_key = "<Esc>",
    multi_windows = true,
})

vim.keymap.set({ "n", "v", "o" }, "f", function()
    hop.hint_char1()
end, { desc = "Hop: pular para qualquer char da tela" })
