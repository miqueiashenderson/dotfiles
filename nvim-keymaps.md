# Neovim — Guia de Keymaps

> Leader = `Espaço`. Ou seja: `<leader>ff` = `Espaço` + `ff`.
> Arquivos fonte: `lua/config/mappings.lua`, `lua/plugins/lspconfig.lua`, `lua/plugins/jdtls.lua`, `lua/plugins/dap.lua`, `lua/plugins/cmp.lua`.

## 1. Geral

| Tecla | Modo | Ação |
|---|---|---|
| `ç` | normal | Vai ao fim da linha e entra em insert (`$a`, teclado ABNT) |
| `vg` | normal | Selecionar arquivo inteiro (`ggVG`) |
| `<leader>h` (`Espaço h`) | normal | Tirar highlight da busca (`:nohlsearch`) |

## 2. Janelas (splits)

| Tecla | Ação |
|---|---|
| `Ctrl+h / j / k / l` | Focar janela esquerda / baixo / cima / direita |

## 3. Buffers — barbar

| Tecla | Ação |
|---|---|
| `Tab` | Próximo buffer (`:BufferNext`) |
| `Shift+Tab` | Buffer anterior (`:BufferPrevious`) |
| `[b` / `]b` | Mover buffer atual para esquerda / direita |
| `<leader>x` (`Espaço x`) | Fechar buffer (`:BufferClose`) |

## 4. Arquivos — nvim-tree

| Tecla | Ação |
|---|---|
| `Ctrl+n` | Abrir/fechar árvore (`:NvimTreeToggle`) |
| `<leader>e` (`Espaço e`) | Focar árvore (`:NvimTreeFocus`) |

Dentro da árvore (padrão `default_on_attach`): `Enter` abre, `a` cria arquivo/pasta, `r` renomeia, `d` apaga, `x` corta, `c` copia, `p` cola, `R` refresh, `H` mostra ocultos, `q` fecha. Digite `:help nvim-tree` ou `g?` com a árvore focada para lista completa.

## 5. Busca — fzf-lua

| Tecla | Ação |
|---|---|
| `<leader>ff` | Buscar arquivos |
| `<leader>fg` | Buscar texto no projeto (`live_grep`) |
| `<leader>fb` | Buscar buffers abertos |
| `<leader>fd` | Diagnósticos do arquivo atual |

Dentro do fzf: `Enter` abre, `Ctrl+j/k` navega, `Esc` ou `Ctrl+c` sai, `Tab` multi-seleciona.

## 6. Problemas — trouble + TODO

| Tecla | Ação |
|---|---|
| `<leader>tx` | Lista de diagnósticos do projeto |
| `<leader>tw` | Diagnósticos só do buffer atual |
| `<leader>tt` | Lista de `TODO/FIXME` (`todo-comments`) |

> Prefixo `t` (antes era `x`): `Espaço x` ficou **exclusivo** para fechar buffer (`BufferClose`) — sem conflito, fecha na hora, sem esperar timeout.

Marcações `TODO:`, `FIX:`, `NOTE:`, `WARN:` em qualquer arquivo aparecem em `<leader>tt` e com highlight.

## 7. Terminal

| Tecla | Modo | Ação |
|---|---|---|
| `Alt+i` | normal | Abrir/focar o FTerm (uma tecla; nunca fecha por engano) |
| `Alt+i` | terminal | Fechar o FTerm e voltar ao código |
| `Esc` | terminal | Fechar o FTerm e voltar ao código (sessão continua viva) |
| `Ctrl+Alt+i` | normal | Abrir/fechar terminal split embaixo (estilo VSCode) |
| `Ctrl+Alt+i` | terminal | Fechar split e voltar ao código |
| `Ctrl+h / k / l` | terminal | Pular do terminal para janela ao lado (sem `Esc` antes) |

> Fechar o FTerm **não mata** a sessão: o processo continua rodando escondido; `Alt+i` reabre no mesmo estado.
> Para **interromper** um processo no terminal use `Ctrl+C` — o `Esc` é capturado pelo nvim e não chega no processo.
> `Ctrl+Alt+i` nem todo terminal entrega — se não funcionar, use `Alt+i` (mais confiável).

## 8. LSP — vale para Python/C/Lua/Java (via `LspAttach`)

| Tecla | Ação |
|---|---|
| `gd` | Ir para definição |
| `gD` | Ir para declaração |
| `gi` | Ir para implementação |
| `gr` | Listar referências |
| `K` | Documentação flutuante (hover) |
| `Espaço sh` | Ajuda de assinatura (parâmetros) |
| `Espaço rn` | Renomear símbolo |
| `Espaço ca` | Code actions (quickfix do LSP) |
| `Espaço D` | Ir para definição de tipo |
| `Espaço d` | Mostrar erro/warning da linha (float) |
| `[d` / `]d` | Erro anterior / próximo |
| `Espaço q` | Jogar diagnósticos na loclist |
| `Espaço f` | Formatar (conform.nvim, fallback LSP) |
| `Espaço wa/wr/wl` | Add/remover/listar pasta do workspace |

## 9. Java — jdtls (só em arquivo `.java`)

| Tecla | Modo | Ação |
|---|---|---|
| `<leader>o` | normal | Organizar imports |
| `<leader>rv` | normal | Extrair variável |
| `<leader>rc` | normal | Extrair constante |
| `<leader>rm` | visual | Extrair método da seleção |
| `<leader>dt` | normal | Rodar classe de teste (exige `java-test`) |
| `<leader>dn` | normal | Rodar método de teste mais próximo |

Pré-requisito debug/teste: `:MasonInstall java-debug-adapter java-test`.

## 10. Debug — DAP

| Tecla | Ação |
|---|---|
| `F5` | Continuar / iniciar debug |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Breakpoint com condição (pergunta texto) |
| `<leader>du` | Toggle UI do debug |
| `<leader>dr` | Abrir REPL do debug |

Fluxo típico: `<leader>b` na linha → `F5` → `F10/F11` navega → UI fecha sozinha ao terminar.

## 11. Autocomplete — nvim-cmp (modo insert)

| Tecla | Ação |
|---|---|
| `Ctrl+Espaço` | Abrir sugestões |
| `Tab` | Próxima sugestão / expande ou pula snippet |
| `Shift+Tab` | Sugestão anterior / volta no snippet |
| `Enter` | Confirma seleção |
| `Ctrl+e` | Cancela menu |
| `Ctrl+b` / `Ctrl+f` | Rola documentação do item |

Fontes: LSP → snippets (`friendly-snippets`) → buffer → path.

## 12. Edição — surround / autopairs / Comment

surround (`nvim-surround`):
- `ysiw"` — cerca palavra com `"`: `ola` → `"ola"`
- `cs"'` — troca `"` por `'`
- `ds"` — remove `"`

autopairs: fecha `(`, `[`, `{`, `"`, `'` sozinho.

Comment (`Comment.nvim`):
- `gcc` — comenta/descomenta linha
- `gc` + movimento (ex.: `gc2j`, visual `gc`) — comenta bloco

## 13. Git — gitsigns (padrão, sem keymap custom)

Use no buffer: `:Gitsigns preview_hunk`, `:Gitsigns stage_hunk`, `:Gitsigns reset_hunk`, `:Gitsigns blame_line`, `:Gitsigns diffthis`. Sugestão: rode `:WhichKey` e digite prefixo para descobrir.

## 14. Descoberta

- `:WhichKey` — mostra todos os atalhos por prefixo (digite `Espaço` e espere).
- `:FzfLua keymaps` — busca qualquer keymap pelo nome.
- `:checkhealth mason` / `:Mason` — status de LSPs e ferramentas.
- `:LspInfo` — LSP ativo no buffer atual.

## 15. Sessão (persistence)

Sessão é **por pasta**. Salva sozinha ao sair (`:qa`).

| Ação | Como |
|---|---|
| `nvim` puro (sem args) | Restaura sozinho |
| `nvim .` | Aperte `<leader>qs` após abrir (o buffer de diretório impede restore automático) |
| `<leader>qs` | Restaurar sessão da pasta atual |
| `<leader>ql` | Restaurar última sessão global |
| `<leader>qd` | Não salvar ao sair (sessão temporária) |

## 16. Comandos vim-plug / mason (manutenção)

| Comando | Ação |
|---|---|
| `:PlugInstall` | Instala plugs novos |
| `:PlugClean` | Remove plugs que saíram do `init.lua` |
| `:PlugUpdate` | Atualiza todos |
| `:Mason` | Painel de LSPs/formatadores |
| `:MasonToolsInstall` | Instala formatadores/linters do `tool-installer.lua` |
| `:MasonInstall java-debug-adapter java-test` | Libera debug/teste Java |

## 17. Text objects — treesitter (`nvim-treesitter-textobjects`)

Seleção (use no modo visual ou depois de um operador: `d`, `c`, `y`…):

| Tecla | Seleciona |
|---|---|
| `af` / `if` | função inteira / interior da função |
| `ac` / `ic` | classe inteira / interior da classe |
| `aa` / `ia` | parâmetro / interior do parâmetro |

Exemplos: `dif` (apaga a função), `yac` (copia a classe), `ci`+`if`…

Movimento:

| Tecla | Vai para |
|---|---|
| `]f` / `[f` | próxima função / função anterior |
| `]c` / `[c` | próxima classe / classe anterior |
| `]a` / `[a` | próximo parâmetro / parâmetro anterior |

## 18. Dobras — nvim-ufo + statuscol

| Tecla | Ação |
|---|---|
| `zR` / `zM` | abrir / fechar todas as dobras |
| `zr` | abrir dobras (exceto kinds) |
| `<leader>K` | pré-visualizar a dobra fechada sob o cursor |

A coluna da esquerda mostra a coluna de fold (sem dígitos), os sinais e o número
da linha — clique no fold abre/fecha, clique no sinal de diagnóstico abre o float.

## 19. Busca, pulo e yank

| Tecla | Ação |
|---|---|
| `/` `n` `N` `*` `#` | busca com contador tipo `3/47` na barra (nvim-hlslens) |
| `f` | **pula pra qualquer char da tela** (hop, não só a linha) |
| `<Esc>` | cancela o pulo do hop |
| `<leader>p` | histórico de yank (picker) |
| `[y` / `]y` | item anterior/próximo do histórico de yank (após colar) |
| `p` / `P` | colar com destaque do texto colado (yanky) |

> Pra voltar ao `f` nativo (só na linha): apague o keymap em `lua/plugins/hop.lua`.

## 20. Atalhos gerais extras

| Tecla | Ação |
|---|---|
| `Alt+j` / `Alt+k` | mover linha (ou seleção) pra baixo/cima |
| `Ctrl+u` (insert) | palavra → MAIÚSCULAS |
| `<leader><Space>` (duas barras de espaço) | remover espaços no fim das linhas |
| `ZR` | recarregar a config sem reiniciar o nvim |
| `<space>Q` | diagnósticos do buffer atual → quickfix |
| `<space>gd` / `<space>gr` / `<space>gi` | preview de definições/referências/implementações (glance) |

## 21. Comandos extras

| Comando | Ação |
|---|---|
| `:Redir hi` | captura a saída de um comando numa aba nova |
| `:CopyPath relative` | copia caminho (aceita `nameonly`/`relative`/`absolute`) |
| `:Datetime` / `:Datetime 1234567890` | data atual ou timestamp → data |
| `:JSONFormat` | formata JSON (também com `:'<,'>JSONFormat`) |
| `:Edit lua/plugins/*.lua` | abre vários arquivos de uma vez |
| `:StripTrailingWhitespace` | remove espaços no fim das linhas |
| `:ColorizerToggle` | liga/desliga cores `#ff0000` pintadas |

## 22. Melhorias visuais (sem tecla)

- **Realce do símbolo sob o cursor** em todas as ocorrências (vim-illuminate).
- **Barra de progresso do LSP** no canto (fidget).
- **Winbar** com o caminho do arquivo estilo VSCode (dropbar).
- **Guia de indentação** do escopo atual (mini.indentscope).
- **Quickfix** com preview (nvim-bqf).
- **Diagnósticos**: sem texto inline; float automático sob o cursor (vira e fecha sozinho).
- **`vim.*` completion** nos `.lua` da config (lazydev).

## 23. Movimento e scroll (neoscroll)

| Tecla | Ação |
|---|---|
| `Ctrl+d` / `Ctrl+u` | scroll suave de meia tela (com animação) |
| `Ctrl+f` / `Ctrl+b` | scroll suave de tela cheia |
| `zt` / `zz` / `zb` | centraliza a linha no topo/meio/fundo com animação |

- Kitty: rastro de cursor animado (`cursor_trail 6` no `kitty.conf`; `0` desliga, 1–10 = intensidade).
