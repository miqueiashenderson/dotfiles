local ok, tool = pcall(require, "mason-tool-installer")
if not ok then return end

-- Garante binários que o conform.nvim + nvim-lint usam.
-- (Seus LSPs continuam no ensure_installed de plugins/lspconfig.lua)
tool.setup({
    ensure_installed = {
        -- formatadores (usados em plugins/conform.lua)
        "stylua",
        "black",
        "prettier",
        "google-java-format",
        "clang-format",
        "shfmt",
        -- linters (usados em plugins/lint.lua)
        "ruff",
        "shellcheck",
    },
    auto_update = false,
    run_on_start = true,
})
