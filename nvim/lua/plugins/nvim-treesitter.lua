local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

configs.setup {
    ensure_installed = { "lua", "python", "java", "vimdoc", "markdown", "cpp", "bash", "json", "yaml", "html", "css", "javascript" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
