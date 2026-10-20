-- Glance: preview flutuante de definições/referências (sem sair do lugar)
require("glance").setup({
    height = 25,
    border = { enable = true },
})

vim.keymap.set("n", "<space>gd", "<cmd>Glance definitions<cr>", { desc = "Glance: definições" })
vim.keymap.set("n", "<space>gr", "<cmd>Glance references<cr>", { desc = "Glance: referências" })
vim.keymap.set("n", "<space>gi", "<cmd>Glance implementations<cr>", { desc = "Glance: implementações" })
