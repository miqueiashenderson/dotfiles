local cmp = require('cmp')
local luasnip = require('luasnip')

-- Snippets prontos (python, java, lua, etc.)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    -- Habilita snippets
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Atalhos de teclado para o menu de autocompletar
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- Abrir autocompletar
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter para aceitar

        -- Este é o atalho mais importante:
        -- Tab para navegar para a próxima sugestão
        -- Shift-Tab para navegar para a sugestão anterior
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    -- Fontes de onde o `cmp` vai buscar sugestões
    sources = cmp.config.sources({
        { name = 'lazydev', group_index = 0 }, -- API do Neovim (group 0 = sempre ativo)
        { name = 'nvim_lsp' },  -- Sugestões do LSP
        { name = 'luasnip' },   -- Sugestões de Snippets
        { name = 'buffer' },    -- Sugestões do texto no buffer atual
        { name = 'path' },      -- Sugestões de caminhos de arquivo
    })
})
