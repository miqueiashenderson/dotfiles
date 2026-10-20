vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "ç", "$a")

map("n", "<C-l>", "<Cmd>wincmd l<CR>", opts)
map("n", "<C-h>", "<Cmd>wincmd h<CR>", opts)
map("n", "<C-k>", "<Cmd>wincmd k<CR>", opts)
map("n", "<C-j>", "<Cmd>wincmd j<CR>", opts)

map("n", "<leader>h", "<Cmd>nohlsearch<CR>", opts)

map("n", "vg", "ggVG", { noremap = true, silent = true, desc = "Selecionar tudo" })

-- barbar mappings
map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "[b", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "]b", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)

-- nvim-tree mappings
map("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>e", "<Cmd>NvimTreeFocus<CR>", opts)

-- fzf-lua mappings
map("n", "<leader>ff", "<Cmd>FzfLua files<CR>", vim.tbl_extend("force", opts, { desc = "Arquivos" }))
map("n", "<leader>fg", "<Cmd>FzfLua live_grep<CR>", vim.tbl_extend("force", opts, { desc = "Grep" }))
map("n", "<leader>fb", "<Cmd>FzfLua buffers<CR>", vim.tbl_extend("force", opts, { desc = "Buffers" }))
map("n", "<leader>fd", "<Cmd>FzfLua diagnostics_document<CR>", vim.tbl_extend("force", opts, { desc = "Diagnósticos" }))

-- trouble.nvim mappings
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", opts)
map("n", "<leader>xw", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", opts)
map("n", "<leader>xt", "<Cmd>Trouble todo toggle<CR>", vim.tbl_extend("force", opts, { desc = "TODOs" }))

-- FTerm mappings (floating terminal)
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Bottom-split terminal (estilo VSCode)
local term_buf = -1
local term_win = -1

map("n", "<C-A-i>", function()
    if vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_win_close(term_win, false)
        term_win = -1
        return
    end

    vim.cmd("botright split")
    vim.cmd("resize 14")

    if vim.api.nvim_buf_is_valid(term_buf) then
        vim.api.nvim_set_current_buf(term_buf)
    else
        vim.cmd("terminal")
        term_buf = vim.api.nvim_get_current_buf()
    end

    term_win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert")
end, opts)

map("t", "<C-A-i>", "<C-\\><C-n><Cmd>close<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
-- Navegar do terminal para o código sem precisar apertar Esc antes
map("t", "<C-k>", "<C-\\><C-n><Cmd>wincmd k<CR>", opts)
map("t", "<C-h>", "<C-\\><C-n><Cmd>wincmd h<CR>", opts)
map("t", "<C-l>", "<C-\\><C-n><Cmd>wincmd l<CR>", opts)

-- == Atalhos roubados do jdhao/nvim-config ==

-- Mover linha/bloco com Alt+j / Alt+k
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, desc = "Mover linha pra baixo" })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, desc = "Mover linha pra cima" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Mover seleção pra baixo" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Mover seleção pra cima" })

-- Palavra sob o cursor → MAIÚSCULAS (no insert; substitui o <C-u> nativo)
map("i", "<C-u>", "<Esc>viwUa", { noremap = true, desc = "Palavra → MAIÚSCULAS" })

-- Remove espaços no fim das linhas (:StripTrailingWhitespace)
map("n", "<leader><Space>", "<Cmd>StripTrailingWhitespace<CR>",
    { noremap = true, desc = "Remover espaços no fim das linhas" })

-- Recarregar a config sem reiniciar o nvim
map("n", "ZR", function()
    for name in pairs(package.loaded) do
        if name:match("^config%..*") or name:match("^plugins%..*") then
            package.loaded[name] = nil
        end
    end
    vim.cmd("source $MYVIMRC")
    vim.notify("Config recarregada (ZR)")
end, { desc = "Recarregar configuração do nvim" })
