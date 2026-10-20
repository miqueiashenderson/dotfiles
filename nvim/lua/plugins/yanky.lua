-- yanky.nvim: histórico de yank (ring) + destaque do texto colado
require("yanky").setup({
    preserve_cursor_position = { enabled = false },
    highlight = {
        on_put = true,
        on_yank = false,
        timer = 300,
    },
    system_clipboard = { sync_with_ring = true },
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")

-- Cicla pelo histórico de yank depois de colar (funciona só após um p/P)
vim.keymap.set("n", "[y", "<Plug>(YankyPreviousEntry)", { desc = "Yank: item anterior" })
vim.keymap.set("n", "]y", "<Plug>(YankyNextEntry)", { desc = "Yank: próximo item" })

-- Picker do histórico inteiro
vim.keymap.set({ "n", "x" }, "<leader>p", "<cmd>YankyRingHistory<cr>", { desc = "Histórico de yank" })
