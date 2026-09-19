#!/usr/bin/env bash
# Instala os dotfiles via symlinks. Rode a partir da raiz do repo.
# Uso: ./install.sh [--copy]
#   padrão: cria symlinks  |  --copy: copia arquivos (sem link)
set -euo pipefail

MODE="link"
[[ "${1:-}" == "--copy" ]] && MODE="copy"

DOT="$(cd "$(dirname "$0")" && pwd)"

install_file() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ "$MODE" == "copy" ]]; then
    cp -f "$src" "$dest"
    echo "copiado: $dest"
  else
    ln -sfn "$src" "$dest"
    echo "link: $dest -> $src"
  fi
}

install_file "$DOT/.bashrc" "$HOME/.bashrc"

mkdir -p "$HOME/.config"
[[ -e "$HOME/.config/nvim" && ! -L "$HOME/.config/nvim" ]] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)" && echo "backup: ~/.config/nvim antigo movido"
[[ -e "$HOME/.config/kitty" && ! -L "$HOME/.config/kitty" ]] && mv "$HOME/.config/kitty" "$HOME/.config/kitty.bak.$(date +%s)" && echo "backup: ~/.config/kitty antigo movido"

if [[ "$MODE" == "copy" ]]; then
  mkdir -p "$HOME/.config/nvim" "$HOME/.config/kitty"
  cp -r "$DOT/nvim/." "$HOME/.config/nvim/"
  cp "$DOT/kitty/kitty.conf" "$DOT/kitty/tokyonight_night.conf" "$HOME/.config/kitty/"
  echo "copiado: ~/.config/nvim e ~/.config/kitty"
else
  ln -sfn "$DOT/nvim" "$HOME/.config/nvim"
  ln -sfn "$DOT/kitty" "$HOME/.config/kitty"
  echo "link: ~/.config/nvim e ~/.config/kitty"
fi

echo "OK ($MODE). Abra o nvim e rode :PlugInstall, depois :MasonToolsInstall"
