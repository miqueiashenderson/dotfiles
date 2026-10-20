-- nvim-colorizer: pinta cores hex (#ff0000) e nomes de cor com a cor real
require("colorizer").setup({
    filetypes = { "*" },
    user_commands = true, -- :ColorizerToggle
})
