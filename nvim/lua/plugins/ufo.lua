-- Folding bonito (nvim-ufo) + statuscolumn com coluna de fold sem dígitos
-- Opções de fold ficam em lua/config/options.lua
local builtin = require("statuscol.builtin")

require("statuscol").setup({
    relculright = false,
    segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
        },
    },
})

require("ufo").setup({
    -- LSP quando suportar, senão indentação
    provider_selector = function() return { "lsp", "indent" } end,
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Abrir todas as dobras" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Fechar todas as dobras" })
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Abrir dobras (exceto kinds)" })
vim.keymap.set("n", "<leader>K", function()
    require("ufo").peekFoldedLinesUnderCursor()
end, { desc = "Pré-visualizar dobra fechada" })
