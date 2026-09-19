local ok, persistence = pcall(require, "persistence")
if not ok then return end

persistence.setup({
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
    options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
    -- Fecha a tree antes de salvar: sem isso a sessão grava só o buffer NvimTree_1
    pre_save = function()
        local ok, api = pcall(require, "nvim-tree.api")
        if ok then api.tree.close() end
    end,
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- <leader>qs = restaura sessão da pasta atual | ql = última global | qd = não salvar ao sair
map("n", "<leader>qs", persistence.load, vim.tbl_extend("force", opts, { desc = "Sessão: restaurar pasta" }))
map("n", "<leader>ql", function() persistence.load({ last = true }) end, vim.tbl_extend("force", opts, { desc = "Sessão: última global" }))
map("n", "<leader>qd", persistence.stop, vim.tbl_extend("force", opts, { desc = "Sessão: não salvar" }))

-- Após restaurar sessão: limpa buffers vazios da tree e reabre ela zerada
vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        vim.schedule(function()
            local ok, api = pcall(require, "nvim-tree.api")
            if not ok then return end
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_get_name(buf):match("NvimTree_") then
                    pcall(vim.api.nvim_buf_delete, buf, { force = true })
                end
            end
            api.tree.open()
        end)
    end,
})
-- Auto-restaura com `nvim` puro.
-- Com `nvim .` use <leader>qs: o buffer de diretório conflita com o restore automático.
vim.api.nvim_create_autocmd("VimEnter", {
    nested = true,
    callback = function()
        if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
            persistence.load()
        end
    end,
})
