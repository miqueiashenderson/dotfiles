# Terminal (bash) — Guia de Keymaps

> Shell: `bash` (`SHELL:/bin/bash`), com `fzf` ativo (`~/.fzf.bash`). Funciona dentro do kitty e no FTerm do nvim.

## 1. Histórico

| Tecla | Ação |
|---|---|
| `Ctrl+r` | Busca reversa com fuzzy (fzf): digita parte → `Enter` executa, `Esc` edita, `Ctrl+c` cancela |
| `Ctrl+r` de novo | Pula para ocorrência anterior |
| `↑` / `↓` | Comando anterior / próximo |
| `!!` + `Enter` | Repete último comando (`sudo !!` repete com sudo) |
| `!texto` + `Enter` | Executa último comando que começa com `texto` |
| `history \| grep X` | Lista histórico filtrado |

## 2. Arquivos com fzf (instalado)

| Tecla | Ação |
|---|---|
| `Ctrl+t` | Lista arquivos/pastas fuzzy → `Enter` cola no comando |
| `Alt+c` | Entra (cd) numa pasta fuzzy |
| `**` + `Tab` | Completa caminho fuzzy (ex.: `nvim **<Tab>`) |

## 3. Edição de linha (readline, padrão bash)

| Tecla | Ação |
|---|---|
| `Ctrl+a` / `Ctrl+e` | Início / fim da linha |
| `Ctrl+u` / `Ctrl+k` | Apaga até início / até fim |
| `Ctrl+w` / `Alt+d` | Apaga palavra para trás / frente |
| `Alt+b` / `Alt+f` | Pula palavra para trás / frente |
| `Ctrl+l` | Limpa tela (igual `clear`) |
| `Ctrl+c` | Cancela comando atual |
| `Ctrl+d` | Fecha shell (EOF) / apaga char |
| `Ctrl+z` | Suspende (`fg` volta), `Ctrl+y` cola o que `Ctrl+u` cortou |

## 4. Seus aliases (`~/.bashrc`)

| Alias | Expande para |
|---|---|
| `..` / `...` | `cd ..` / `cd ../..` |
| `ll` | `clear; ls` |
| `rm/cp/mv` | Modo interativo (`-i`) |
| `sy` | `sudo pacman -Syyuu` |
| `open X` | `xdg-open X` |

## 5. Kitty + terminal (para referência)

| Tecla | Ação |
|---|---|
| `Ctrl+Shift+c/v` | Copiar / colar |
| `Ctrl+Shift+Enter` | Novo split |
| `Ctrl+Shift+t` = nova aba do kitty. `Ctrl+t` agora chega no bash = fuzzy de arquivos. |

Resolvido: `map ctrl+t new_tab` removido do `kitty.conf` (era ele que roubava o `Ctrl+t` do fzf).
