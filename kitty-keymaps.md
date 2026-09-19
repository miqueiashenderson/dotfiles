# Kitty — Guia de Keymaps

> Fonte: `~/.config/kitty/kitty.conf`. Tema ativo: `tokyonight_night.conf` (combina com nvim `tokyonight-night`).
> Recarregar config sem fechar: `Ctrl+Shift+r`.

## 1. Clipboard

| Tecla | Ação |
|---|---|
| `Ctrl+Shift+c` | Copiar seleção |
| `Ctrl+Shift+v` | Colar |
| Seleção com mouse | Copia sozinha (`copy_on_select clipboard`) |

## 2. Janelas — splits dentro da mesma aba

| Tecla | Ação |
|---|---|
| `Ctrl+Shift+Enter` | Nova janela (split) |
| `Ctrl+Shift+l` | Focar próxima janela (`next_window`) |
| `Ctrl+Shift+h` | Focar janela anterior (`previous_window`) |
| `Ctrl+Shift+x` | Fechar janela atual |
| `Ctrl+Shift+i` | Alternar layout (tall / fat / grid / splits) |

Fluxo típico: `Ctrl+Shift+Enter` abre split → `Ctrl+Shift+h/l` alterna entre código e comando.

## 3. Abas

| Tecla | Ação |
|---|---|
| `Ctrl+Shift+t` | Nova aba |
| `Ctrl+t` | Liberado p/ fzf do bash (buscar arquivo) |
| `Ctrl+Shift+w` | Fechar aba atual |
| `Ctrl+Shift+t` | (padrão kitty) próxima aba — não remapeado, continua valendo |
| `Ctrl+Shift+1..9` | (padrão) ir para aba N |

Título da aba: `índice:nome` (`tab_title_template "{index}:{title}"`), ex.: `1:nvim`, `2:bash`.

## 4. Config / tema

| Tecla | Ação |
|---|---|
| `Ctrl+Shift+r` | Recarregar `kitty.conf` na hora |

Trocar tema: edite o bloco final do `kitty.conf` — `include tokyonight_night.conf` ativo; alternativas comentadas `eldritch.conf`, `decay.conf`, `oxocarbon.conf`. Depois `Ctrl+Shift+r`.

## 5. Padrões do kitty que continuam valendo (não remapeados)

| Tecla | Ação |
|---|---|
| `Ctrl+Shift+u` | Scroll para cima (pager/scrollback de 10000 linhas) |
| `Ctrl+Shift+d` | Scroll para baixo |
| `Ctrl+Shift+g` | Início do scrollback (`scroll_home`) |
| `Ctrl+Shift+End` | Fim do scrollback |
| `Ctrl+Shift+f` | Buscar no scrollback |
| `Ctrl+Shift+e` | Abrir scrollback no editor (`edit_config_file` não — é `open_scrollback`) |
| `Ctrl+Shift+o` | Inspecionar última saída de comando |
| `Ctrl+Shift+p>n` | Próxima janela, `Ctrl+Shift+p>p` anterior (atalho alternativo de janela) |
| `Ctrl+Shift+q` | Fechar kitty |

## 6. URLs (detecção ligada)

`detect_urls yes` sublinha links. `Ctrl+clique` ou `kitty +kitten hints --hints url` abre no navegador (`open_url_with default`).

## 7. Seu fluxo com nvim (para referência)

Dentro do nvim você usa `Alt+i` (terminal flutuante FTerm) — independente das abas do kitty. Use splits do kitty (`Ctrl+Shift+Enter`) só quando quiser algo fora do nvim (ex.: `lazygit`, docs, segundo projeto).

## 8. Manutenção

| Ação | Como |
|---|---|
| Editar config | `nvim ~/.config/kitty/kitty.conf` |
| Testar sem quebrar | `kitty --config ~/.config/kitty/kitty.conf` numa janela nova |
| Socket p/ integração nvim | `unix:/tmp/kitty-nvim-socket` (`allow_remote_control socket-only`) |
