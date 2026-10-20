-- Comandos úteis (adaptados do jdhao/nvim-config)

-- Redir: captura a saída de um comando numa aba nova
-- ex.: :Redir hi  |  :Redir LspInfo
vim.api.nvim_create_user_command("Redir", function(ctx)
    local lines = vim.split(vim.fn.execute(ctx.args), "\n", { plain = true })
    vim.cmd("tabnew")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
end, {
    nargs = 1,
    complete = "command",
    desc = "Redireciona a saída de um comando para uma aba nova",
})

-- StripTrailingWhitespace: remove espaços no fim das linhas (sem sujar histórico)
vim.api.nvim_create_user_command("StripTrailingWhitespace", function()
    local view = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
end, { desc = "Remove espaços no fim de todas as linhas" })

-- CopyPath: copia o caminho do arquivo atual pra área de transferência
-- ex.: :CopyPath relative  |  :CopyPath nameonly  |  :CopyPath absolute
vim.api.nvim_create_user_command("CopyPath", function(ctx)
    local full = vim.fn.expand("%:p")
    local path

    if ctx.args == "nameonly" then
        path = vim.fn.fnamemodify(full, ":t")
    elseif ctx.args == "relative" then
        local root = vim.fs.root(0, { ".git", "pyproject.toml", "package.json" })
        if root then
            path = full:gsub("^" .. vim.pesc(root) .. "/?", "")
        else
            path = full
            vim.notify("Raiz do projeto não encontrado", vim.log.levels.WARN)
        end
    else
        path = full
    end

    vim.fn.setreg("+", path)
    vim.notify("Caminho copiado: " .. path)
end, {
    nargs = "?",
    complete = function() return { "nameonly", "relative", "absolute" } end,
    desc = "Copia o caminho do arquivo (nameonly|relative|absolute)",
})

-- Datetime: data/hora atual, ou converte um timestamp Unix em data
-- ex.: :Datetime  |  :Datetime 1234567890
vim.api.nvim_create_user_command("Datetime", function(ctx)
    if ctx.args ~= "" then
        local ts = tonumber(ctx.args)
        if ts then
            print(os.date("%Y-%m-%d %H:%M:%S", ts))
            return
        end
    end
    print(os.date("%A, %d/%m/%Y %H:%M:%S"))
end, {
    nargs = "?",
    desc = "Mostra a data/hora atual ou converte timestamp Unix",
})

-- JSONFormat: formata o buffer (ou o intervalo selecionado) com python -m json.tool
vim.api.nvim_create_user_command("JSONFormat", function(ctx)
    local py = vim.fn.executable("python3") == 1 and "python3" or "python"
    if vim.fn.executable(py) ~= 1 then
        vim.notify("python não encontrado", vim.log.levels.WARN)
        return
    end

    local range = ctx.range == 2 and string.format("%d,%d", ctx.line1, ctx.line2) or "%"
    vim.cmd(range .. "!" .. py .. " -m json.tool --indent 2")
end, {
    range = "%",
    desc = "Formata JSON (buffer inteiro ou com :'<,'>JSONFormat)",
})

-- Edit: abre vários arquivos de uma vez (aceita glob)
-- ex.: :Edit lua/plugins/*.lua
vim.api.nvim_create_user_command("Edit", function(ctx)
    local files = vim.fn.glob(table.concat(ctx.fargs, " "), false, true)
    if #files == 0 then files = ctx.fargs end
    for _, f in ipairs(files) do
        vim.cmd("edit " .. vim.fn.fnameescape(f))
    end
end, {
    nargs = "+",
    complete = "file",
    desc = "Edita vários arquivos de uma vez (com glob)",
})
