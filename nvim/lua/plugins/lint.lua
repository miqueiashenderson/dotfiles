local ok, lint = pcall(require, "lint")
if not ok then return end

lint.linters_by_ft = {
    python = { "ruff" },
    sh = { "shellcheck" },
    -- java/c/lua já cobertos pelo LSP (jdtls/clangd/lua_ls); adicione aqui se quiser extra:
    -- javascript = { "eslint_d" },
    -- typescript = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
