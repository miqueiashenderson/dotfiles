local jdtls = require('jdtls')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Keymaps específicos de Java (os genéricos de LSP já vêm do LspAttach em plugins/lspconfig.lua)
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', '<leader>o', jdtls.organize_imports, opts)
    vim.keymap.set('n', '<leader>rv', jdtls.extract_variable, opts)
    vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, opts)
    vim.keymap.set('v', '<leader>rm', function() jdtls.extract_method(true) end, opts)

    -- Debug/teste Java via nvim-dap (exige bundles instalados acima)
    vim.keymap.set('n', '<leader>dt', jdtls.test_class, opts)
    vim.keymap.set('n', '<leader>dn', jdtls.test_nearest_method, opts)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function()
        local root_markers = { 'pom.xml', 'build.gradle', '.git', 'mvnw', 'gradlew', 'settings.gradle' }
        local root_dir = require('jdtls.setup').find_root(root_markers)
        if root_dir == nil then return end

        local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
        local workspace_dir = vim.fn.expand('~/.cache/jdtls/workspace/') .. project_name

        -- Bundles de debug/teste (java-debug-adapter + java-test via mason).
        -- Se ainda não instalados: :MasonInstall java-debug-adapter java-test
        local bundles = {}
        local mason_pkg = vim.fn.expand('~/.local/share/nvim/mason/packages/')
        for _, pattern in ipairs({
            'java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
            'java-test/extension/server/*.jar',
        }) do
            for _, jar in ipairs(vim.fn.glob(mason_pkg .. pattern, true, true)) do
                table.insert(bundles, jar)
            end
        end

        jdtls.start_or_attach({
            cmd = { 'jdtls' },
            root_dir = root_dir,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                java = {},
            },
            init_options = {
                bundles = bundles,
            },
        })
    end,
})
