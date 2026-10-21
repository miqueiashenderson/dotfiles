# dotfiles

Configs pessoais de **Neovim + Kitty + bash** — tema único `cyberdream`, leader `Espaço`, fluxo tudo-dentro-do-nvim (terminal flutuante com `Alt+i`).

## Estrutura

```
.
├── install.sh            # instala via symlinks (ou --copy)
├── .bashrc               # -> ~/.bashrc (zoxide, eza, bat, starship, fzf)
├── nvim/                 # -> ~/.config/nvim
│   ├── init.lua          # vim-plug + requires
│   └── lua/
│       ├── config/       # mappings.lua, options.lua
│       └── plugins/      # um arquivo por plugin
├── kitty/                # -> ~/.config/kitty
│   ├── kitty.conf
│   ├── cyberdream.conf   # tema ativo
│   └── *.conf            # temas alternativos (tokyonight, eldritch…)
├── nvim-keymaps.md       # guia de atalhos do nvim
├── kitty-keymaps.md      # guia de atalhos do kitty
└── terminal-keymaps.md   # guia do bash/fzf
```

## Requisitos

- Neovim **0.12+** (uso `vim.lsp.config` + `vim.lsp.enable` e a branch **main** do nvim-treesitter)
- [vim-plug](https://github.com/junegunn/vim-plug) (gerenciador de plugins)
- `tree-sitter-cli` (obrigatório pra instalar parsers do treesitter)
- Kitty (opcional, mas o tema foi casado com ele)
- Arch Linux (ou adapte): `sudo pacman -S kitty zoxide eza bat starship fzf git nodejs npm python-pip jdtls tree-sitter-cli gcc`
- Nerd Font (ex.: `FiraCode Nerd Font`)

## Instalação

```bash
git clone <seu-repo> ~/dotfiles
cd ~/dotfiles

# 1. Links (recomendado: editar no repo reflete em casa)
./install.sh

# ou cópia simples, sem links:
./install.sh --copy

# 2. Plugins do nvim (dentro do nvim)
:PlugInstall

# 3. LSPs, formatadores, linters e debug adapters (dentro do nvim)
:Mason
:MasonToolsInstall
:MasonInstall java-debug-adapter java-test   # só p/ debug/teste Java
```

O `install.sh` faz backup automático (`~/.config/nvim.bak.<data>`) se já existir pasta real.

## Destaques

| Área | O que tem |
|---|---|
| LSP | `pyright`, `clangd`, `lua_ls` (mason) + Java via `nvim-jdtls` + `glance` (`<space>gd/gr/gi`), progresso (fidget), `vim.*` completion (lazydev) |
| Formato/lint | `conform.nvim` (stylua/black/prettier/…) + `nvim-lint` (ruff/shellcheck), auto-instalados |
| Debug | `nvim-dap` + UI (`F5/F10/F11/F12`, `<leader>b`), teste Java (`<leader>dt/dn`) |
| Busca | `fzf-lua` (`<leader>ff/fg/fb/fd`), contador `3/47` (hlslens), `trouble`, `todo-comments` |
| Arquivos | `nvim-tree` (`Ctrl+n`), sessões por pasta (`persistence`, `<leader>qs`) |
| Dobras | `nvim-ufo` + statuscolumn (`zR`/`zM`, peek com `<leader>K`) |
| Text objects | treesitter: `af/if`, `ac/ic`, `aa/ia` + movimento `]f ]c ]a` |
| Edição | `f` = pulo na tela toda (hop), histórico de yank (`[y ]y`, `<leader>p`), mover linha `Alt+j/k`, colorizer, illuminate, dropbar, indentscope |
| Movimento | scroll suave `Ctrl+d/u/f/b` + `zt/zz/zb` (neoscroll), rastro de cursor no kitty (`cursor_trail`) |
| Diagnósticos | sem texto inline; float sob o cursor + `<space>Q` → quickfix |
| Terminal | FTerm flutuante (`Alt+i`), split estilo VSCode |
| Tema | `cyberdream` no nvim + kitty (lualine incluso), fundo translúcido |

## Atalhos (resumo)

Leader = `Espaço`. Detalhes completos nos `*-keymaps.md`.

- `Tab`/`Shift+Tab` buffers · `Ctrl+n` tree · `Alt+i` terminal
- `<leader>ff/fg` arquivos/grep · `<leader>xx` diagnósticos
- `gd/gr/K` LSP · `Espaço ca` code action · `Espaço f` formatar · `Espaço gd` glance
- `af/if` text object (função) · `]f/[f` próxima função · `zR/zM` dobras
- `f` pula na tela toda (hop) · `[y/]y` histórico de yank · `Ctrl+d/u` scroll suave
- `Alt+j/k` mover linha · `Espaço Espaço` limpar espaços · `ZR` recarregar config
- `F5` debug · `<leader>b` breakpoint · `<leader>qs` sessão

## Manutenção

```bash
# dentro do nvim
:PlugUpdate        # atualiza plugins
:PlugClean         # remove plugins que saíram do init.lua
:MasonToolsInstall # garante formatadores/linters
```

## Notas

- `tokyonight-night`/`nordic`/`gruvbox`/`eldritch`/`decay`/`oxocarbon` ficam como temas alternativos (o ativo é `cyberdream`, trocando o `require` em `init.lua` / o `include` no `kitty.conf`).
- Sessões salvas em `~/.local/state/nvim/sessions/` (por pasta, fora do git).
- `allow_remote_control socket-only` no kitty existe p/ futura navegação unificada nvim↔kitty (não usado hoje).
- **treesitter na branch main**: o `ensure_installed` antigo não existe mais — os parsers são listados em `ts.install{}` em `lua/plugins/nvim-treesitter.lua` e o realce liga por autocmd `FileType`. Exige `tree-sitter-cli`.
- **Diagnósticos sem texto inline** (`virtual_text = false`): o float aparece sozinho sob o cursor. Pra voltar ao texto inline, edite `lua/config/diagnostics.lua`.
- **`f` do hop**: pula pra qualquer lugar da tela (não só a linha). Reverta removendo o keymap em `lua/plugins/hop.lua`.
- **kitty**: tema atual é `cyberdream` (`include cyberdream.conf` no kitty.conf); rastro de cursor com `cursor_trail 6` (exige kitty >= 0.37).
- **Testando temas**: `:Tema <nome>` troca o tema do nvim e do kitty ao vivo (ex.: `kanagawa`, `tokyonight-night`, `cyberdream`; `Tab` completa). A troca **não persiste** no nvim ao reiniciar (padrão = cyberdream, definido no `init.lua`); no kitty ela persiste (a linha `include` é reescrita). Exige kitty com `listen_on` (já configurado). Temas do kitty em `kitty/*.conf`.
# dotfiles
