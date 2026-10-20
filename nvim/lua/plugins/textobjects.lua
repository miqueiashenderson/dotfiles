-- Text objects via treesitter (branch MAIN do nvim-treesitter-textobjects)
-- Seleção:  af/if (função) · ac/ic (classe) · aa/ia (parâmetro)
-- Movimento: ]f/[f · ]c/[c · ]a/[a
require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        selection_modes = {
            ["@function.outer"] = "V", -- função inteira: linewise
            ["@class.outer"] = "V",
        },
    },
    move = {
        set_jumps = true,
    },
})

local function select(query)
    return function()
        require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
    end
end

local function move(fn, query)
    return function()
        require("nvim-treesitter-textobjects.move")[fn](query, "textobjects")
    end
end

local xomode = { "x", "o" }
vim.keymap.set(xomode, "af", select("@function.outer"), { desc = "TS: função (externo)" })
vim.keymap.set(xomode, "if", select("@function.inner"), { desc = "TS: função (interno)" })
vim.keymap.set(xomode, "ac", select("@class.outer"), { desc = "TS: classe (externo)" })
vim.keymap.set(xomode, "ic", select("@class.inner"), { desc = "TS: classe (interno)" })
vim.keymap.set(xomode, "aa", select("@parameter.outer"), { desc = "TS: parâmetro (externo)" })
vim.keymap.set(xomode, "ia", select("@parameter.inner"), { desc = "TS: parâmetro (interno)" })

local nomode = { "n", "x", "o" }
vim.keymap.set(nomode, "]f", move("goto_next_start", "@function.outer"), { desc = "TS: próxima função" })
vim.keymap.set(nomode, "[f", move("goto_previous_start", "@function.outer"), { desc = "TS: função anterior" })
vim.keymap.set(nomode, "]c", move("goto_next_start", "@class.outer"), { desc = "TS: próxima classe" })
vim.keymap.set(nomode, "[c", move("goto_previous_start", "@class.outer"), { desc = "TS: classe anterior" })
vim.keymap.set(nomode, "]a", move("goto_next_start", "@parameter.outer"), { desc = "TS: próximo parâmetro" })
vim.keymap.set(nomode, "[a", move("goto_previous_start", "@parameter.outer"), { desc = "TS: parâmetro anterior" })
