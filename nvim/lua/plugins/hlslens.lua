-- nvim-hlslens: mostra "3/47" na barra enquanto você busca com / * #
local api = vim.api
local keymap = vim.keymap

require("hlslens").setup({
    calm_down = true,
    nearest_only = true,
})

local function activate(direction)
    local cmd = string.format("normal! %s%szzzv", vim.v.count1, direction)
    local ok, msg = pcall(vim.cmd, cmd)

    -- padrão não encontrado no buffer atual: só mostra o erro (E486)
    if not ok then
        local start_idx = string.find(msg, "E486", 1, true)
        if start_idx then
            api.nvim_echo({ { string.sub(msg, start_idx) } }, true, { err = true })
        end
        return
    end

    require("hlslens").start()
end

keymap.set("n", "n", function() activate("n") end, { desc = "Próxima ocorrência (com contador)" })
keymap.set("n", "N", function() activate("N") end, { desc = "Ocorrência anterior (com contador)" })

-- * e # com o cursor parado na palavra (sem saltar)
local function search_word(backwards)
    local word = vim.fn.expand("<cword>")
    if word == "" then
        api.nvim_echo({ { "E348: No string under cursor" } }, true, { err = true })
        return
    end

    local prefix = backwards and "?" or "/"
    local cmd = string.format([[normal! %s\v<%s>]], prefix, word)
    local enter = api.nvim_replace_termcodes("<CR>", true, false, true)
    -- "N" mantém o cursor na palavra atual ao pressionar * / #
    vim.fn.execute(cmd .. enter .. "N")
    require("hlslens").start()
end

keymap.set("n", "*", function() search_word(false) end, { desc = "Buscar palavra (mantém cursor)" })
keymap.set("n", "#", function() search_word(true) end, { desc = "Buscar palavra reverso" })
