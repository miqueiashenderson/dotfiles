-- mini.indentscope: mostra o escopo de indentação atual
require("mini.indentscope").setup({
    symbol = "│",
    options = { try_as_border = true },
    draw = { delay = 100 },
})
