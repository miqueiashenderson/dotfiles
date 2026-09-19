local ok_dap, dap = pcall(require, "dap")
if not ok_dap then return end
local ok_ui, dapui = pcall(require, "dapui")
if not ok_ui then return end
local ok_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
if not ok_mason_dap then return end

-- Instala/adapta automaticamente: debugpy (python), codelldb (c/cpp)
mason_dap.setup({
    ensure_installed = { "python", "codelldb" },
    automatic_installation = true,
    handlers = {},
})

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<F5>", dap.continue, vim.tbl_extend("force", opts, { desc = "Debug: continuar" }))
map("n", "<F10>", dap.step_over, vim.tbl_extend("force", opts, { desc = "Debug: step over" }))
map("n", "<F11>", dap.step_into, vim.tbl_extend("force", opts, { desc = "Debug: step into" }))
map("n", "<F12>", dap.step_out, vim.tbl_extend("force", opts, { desc = "Debug: step out" }))
map("n", "<leader>b", dap.toggle_breakpoint, vim.tbl_extend("force", opts, { desc = "Breakpoint" }))
map("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Condição: ")) end, vim.tbl_extend("force", opts, { desc = "Breakpoint condicional" }))
map("n", "<leader>du", dapui.toggle, vim.tbl_extend("force", opts, { desc = "Debug UI" }))
map("n", "<leader>dr", dap.repl.open, vim.tbl_extend("force", opts, { desc = "Debug REPL" }))
