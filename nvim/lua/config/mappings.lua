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
-- Prefixo `t` (não `x`): `Espaço x` é exclusivo do fechar buffer (BufferClose),
-- evitando a espera do timeoutlen quando `x` também era prefixo do Trouble.
map("n", "<leader>tx", "<Cmd>Trouble diagnostics toggle<CR>", opts)
map("n", "<leader>tw", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", opts)
map("n", "<leader>tt", "<Cmd>Trouble todo toggle<CR>", vim.tbl_extend("force", opts, { desc = "TODOs" }))

-- FTerm mappings (floating terminal)
-- Alt+i (normal): foca o FTerm se já estiver aberto; senão, abre.
-- Nunca fecha por engano — fechar é com Esc (ou Alt+i) dentro do terminal.
vim.keymap.set('n', '<A-i>', function()
    local ok, FTerm = pcall(require, "FTerm")
    if not ok then return end
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_get_option_value('filetype', { buf = vim.api.nvim_win_get_buf(win) }) == 'FTerm' then
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
            return
        end
    end
    FTerm.toggle() -- não está aberto: abre
end)
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
-- Esc no terminal: no FTerm, fecha a janela flutuante e volta ao código
-- (a sessão do terminal continua rodando; Alt+i reabre em 1 tecla).
-- No terminal bottom-split (filetype `term`), o close() do FTerm é no-op,
-- então só sai do insert mode como antes.
-- Obs.: para interromper um processo dentro do terminal use Ctrl+C (o Esc
-- nunca chega até o processo, ele é capturado pelo nvim).
map("t", "<Esc>", "<C-\\><C-n><Cmd>lua require('FTerm').close()<CR>", opts)
-- Navegar do terminal para o código sem precisar apertar Esc antes
map("t", "<C-k>", "<C-\\><C-n><Cmd>wincmd k<CR>", opts)
map("t", "<C-h>", "<C-\\><C-n><Cmd>wincmd h<CR>", opts)
map("t", "<C-l>", "<C-\\><C-n><Cmd>wincmd l<CR>", opts)
