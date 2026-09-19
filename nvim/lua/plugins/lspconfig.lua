-- LSP e Autocomplete (API nova: vim.lsp.config + vim.lsp.enable no Nvim 0.11+)
require("mason").setup()

local map = vim.keymap.set

-- Keymaps globais de LSP via LspAttach (vale para todos os servidores,
-- incluindo jdtls que é anexado por plugins/jdtls.lua)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { noremap = true, silent = true, buffer = ev.buf }

        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', 'gi', vim.lsp.buf.implementation, opts)
        map('n', '<space>sh', vim.lsp.buf.signature_help, opts)
        map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        map('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        map('n', '<space>D', vim.lsp.buf.type_definition, opts)
        map('n', '<space>rn', vim.lsp.buf.rename, opts)
        map('n', '<space>ca', vim.lsp.buf.code_action, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)
        map('n', '<space>d', function() vim.diagnostic.open_float() end, opts)
        map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts)
        map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, opts)
        map('n', '<space>q', vim.diagnostic.setloclist, opts)
        -- Formatação via conform.nvim (com fallback para LSP)
        map('n', '<space>f', function()
            local ok, conform = pcall(require, "conform")
            if ok then
                conform.format({ async = true, lsp_fallback = true })
            else
                vim.lsp.buf.format({ async = true })
            end
        end, opts)
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Config default para todos os servidores
vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

require("mason-lspconfig").setup({
    -- jdtls fica de fora do auto-enable: quem inicia é nvim-jdtls (plugins/jdtls.lua).
    -- O binário ainda é instalado pelo mason e usado via `cmd = { 'jdtls' }`.
    ensure_installed = { "pyright", "clangd", "lua_ls", "jdtls" },
    automatic_enable = {
        exclude = { "jdtls" },
    },
})

-- Habilita explicitamente (jdtls é habilitado pelo autocmd FileType em plugins/jdtls.lua)
vim.lsp.enable({ "pyright", "clangd", "lua_ls" })
