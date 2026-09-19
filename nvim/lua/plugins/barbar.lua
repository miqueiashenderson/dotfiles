local ok, barbar = pcall(require, "barbar")
if not ok then return end
barbar.setup({
    animation = true,
    auto_hide = false,
    focus_on_close = "left",
    icons = {
        filetype = { enabled = true },
        gitsigns = {
            added = { enabled = true },
            changed = { enabled = true },
            deleted = { enabled = true },
        },
    },
})
