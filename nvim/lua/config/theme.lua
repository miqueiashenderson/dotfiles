-- Teste de temas ao vivo: :Tema <nome>
--   - troca o colorscheme do nvim sem reiniciar
--   - mantém o fundo translúcido em qualquer tema
--   - sincroniza o kitty: aplica ao vivo (remote control socket-only)
--     e persiste a linha "include" no kitty.conf
-- Obs: a troca no nvim NÃO persiste ao reiniciar (o padrão continua
-- cyberdream, definido no init.lua). Pra fixar, troque o require de tema.

local TRANSLUCENT = {
    "Normal", "NormalFloat", "NormalNC",
    "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeWinSeparator",
}

local function make_translucent()
    for _, group in ipairs(TRANSLUCENT) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("TemaTranslucido", { clear = true }),
    callback = make_translucent,
    desc = "Mantém fundo translúcido em qualquer tema",
})

local KITTY_DIR = vim.fn.expand("~/.config/kitty")
local KITTY_SOCKET = "unix:/tmp/kitty-nvim-socket"

---@return boolean ok, string msg
local function sync_kitty(name)
    local conf = KITTY_DIR .. "/" .. name:gsub("-", "_") .. ".conf"
    if vim.fn.filereadable(conf) ~= 1 then
        return false, "sem conf (" .. vim.fn.fnamemodify(conf, ":t") .. ")"
    end

    -- Aplica ao vivo em todas as janelas do kitty (exige allow_remote_control
    -- socket-only + listen_on no kitty.conf — já configurados)
    local out = vim.fn.system({ "kitty", "@", "--to", KITTY_SOCKET, "set-colors", "-a", "-c", conf })
    if vim.v.shell_error ~= 0 then
        return false, "sem resposta (" .. vim.trim(out):sub(1, 60) .. ")"
    end

    -- Persiste: troca a linha "include ..." do kitty.conf p/ próximas sessões
    local kconf = KITTY_DIR .. "/kitty.conf"
    local lines = vim.fn.readfile(kconf)
    local fname = vim.fn.fnamemodify(conf, ":t")
    local changed = false
    for i, line in ipairs(lines) do
        if line:match("^include%s") and line ~= "include " .. fname then
            lines[i] = "include " .. fname
            changed = true
        end
    end
    if changed then
        vim.fn.writefile(lines, kconf)
    end
    return true, fname
end

vim.api.nvim_create_user_command("Tema", function(ctx)
    local name = ctx.args

    if not pcall(vim.cmd.colorscheme, name) then
        vim.notify("Tema não encontrado: " .. name, vim.log.levels.WARN)
        return
    end

    -- A lualine se atualiza sozinha no evento ColorScheme (autocmd própria);
    -- aqui só falta o kitty:
    local ok, msg = sync_kitty(name)
    if ok then
        vim.notify("Tema: " .. name .. " — nvim + kitty (" .. msg .. ")")
    else
        vim.notify("Tema: " .. name .. " — nvim ok; kitty: " .. msg, vim.log.levels.WARN)
    end
end, {
    nargs = 1,
    complete = function()
        return vim.fn.getcompletion("", "color")
    end,
    desc = "Troca o tema do nvim (e do kitty, se existir conf) sem reiniciar",
})
