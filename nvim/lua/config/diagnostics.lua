-- Diagnósticos estilo jdhao/nvim-config:
-- sem texto inline (virtual_text), float automático sob o cursor,
-- e atalho pra mandar os diagnósticos do buffer pro quickfix.
local diagnostic = vim.diagnostic

local icons = {
    [diagnostic.severity.ERROR] = "",
    [diagnostic.severity.WARN] = "",
    [diagnostic.severity.INFO] = "",
    [diagnostic.severity.HINT] = "",
}

diagnostic.config({
    underline = false,
    virtual_text = false,
    virtual_lines = false,
    signs = { text = icons },
    severity_sort = true,
    float = {
        source = true,
        header = "Diagnósticos:",
        prefix = " ",
        border = "single",
        max_height = 10,
        max_width = 130,
        close_events = { "CursorMoved", "BufLeave", "WinLeave", "InsertEnter" },
    },
})

-- Float automático na linha do cursor (só em modo normal, sem reabrir
-- se o cursor não se moveu)
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        if vim.api.nvim_get_mode().mode ~= "n" then return end
        if #vim.diagnostic.get(0) == 0 then return end

        local pos = vim.api.nvim_win_get_cursor(0)
        if vim.b.diagnostics_pos and vim.deep_equal(pos, vim.b.diagnostics_pos) then return end
        vim.b.diagnostics_pos = pos

        vim.diagnostic.open_float({ scope = "cursor", focus = false })
    end,
})

-- Diagnósticos do buffer atual -> quickfix (pega todos os níveis)
vim.keymap.set("n", "<space>Q", function()
    local items = vim.diagnostic.toqflist(vim.diagnostic.get(0))
    vim.fn.setqflist({}, " ", { title = "Diagnósticos do buffer", items = items })
    vim.cmd("copen")
end, { desc = "Diagnósticos do buffer → quickfix" })
