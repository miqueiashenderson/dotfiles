# dotfiles

Configs pessoais de **Neovim + Kitty + bash** — tema único `tokyonight-night`, leader `Espaço`, fluxo tudo-dentro-do-nvim (terminal flutuante com `Alt+i`).

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
│   └── tokyonight_night.conf
├── nvim-keymaps.md       # guia de atalhos do nvim
├── kitty-keymaps.md      # guia de atalhos do kitty
└── terminal-keymaps.md   # guia do bash/fzf
```

## Requisitos

- Neovim **0.11+** (uso `vim.lsp.config` + `vim.lsp.enable`)
- [vim-plug](https://github.com/junegunn/vim-plug) (gerenciador de plugins)
- Kitty (opcional, mas o tema foi casado com ele)
- Arch Linux (ou adapte): `sudo pacman -S kitty zoxide eza bat starship fzf git nodejs npm python-pip jdtls`
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
| LSP | `pyright`, `clangd`, `lua_ls` (mason) + Java via `nvim-jdtls` |
| Formato/lint | `conform.nvim` (stylua/black/prettier/…) + `nvim-lint` (ruff/shellcheck), auto-instalados |
| Debug | `nvim-dap` + UI (`F5/F10/F11/F12`, `<leader>b`), teste Java (`<leader>dt/dn`) |
| Busca | `fzf-lua` (`<leader>ff/fg/fb/fd`), `trouble`, `todo-comments` |
| Arquivos | `nvim-tree` (`Ctrl+n`), sessões por pasta (`persistence`, `<leader>qs`) |
| Terminal | FTerm flutuante (`Alt+i`), split estilo VSCode |
| Tema | `tokyonight-night` no nvim + kitty, fundo translúcido |

## Atalhos (resumo)

Leader = `Espaço`. Detalhes completos nos `*-keymaps.md`.

- `Tab`/`Shift+Tab` buffers · `Ctrl+n` tree · `Alt+i` terminal
- `<leader>ff/fg` arquivos/grep · `<leader>tx` diagnósticos
- `gd/gr/K` LSP · `Espaço ca` code action · `Espaço f` formatar
- `F5` debug · `<leader>b` breakpoint · `<leader>qs` sessão

## Manutenção

```bash
# dentro do nvim
:PlugUpdate        # atualiza plugins
:PlugClean         # remove plugins que saíram do init.lua
:MasonToolsInstall # garante formatadores/linters
```

## Notas

- `nordic`/`gruvbox`/`eldritch`/`decay`/`oxocarbon` ficam comentados como temas alternativos.
- Sessões salvas em `~/.local/state/nvim/sessions/` (por pasta, fora do git).
- `allow_remote_control socket-only` no kitty existe p/ futura navegação unificada nvim↔kitty (não usado hoje).
# dotfiles
