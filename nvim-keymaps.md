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
