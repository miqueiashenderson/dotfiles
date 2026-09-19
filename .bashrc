#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ..='cd ..'
alias ...='cd ../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sy='sudo pacman -Syyuu'
alias open='xdg-open'
if command -v bat >/dev/null; then
  alias cat='bat'
fi
if command -v eza >/dev/null; then
  alias ll='clear; eza --git --group-directories-first'
  alias lla='clear; eza -lh --git'
else
  alias ll='clear; ls --color=auto'
  alias lla='clear; ls -lh --color=auto'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias kitty='DISPLAY=:1 kitty'
# fastfetch só em terminal interativo de login (não a cada Alt+i/split). Descomente se quiser sempre:
# fastfetch
[[ $- == *i* ]] && command -v fastfetch >/dev/null && shopt -q login_shell && fastfetch
. "$HOME/.cargo/env"

export PATH="$PATH:/usr/lib/qt6/bin"

# Histórico maior, sem duplicadas
HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend

# fzf com preview (bat/eza se existirem)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {} 2>/dev/null || ls --color=always {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=1 --color=always {} 2>/dev/null || ls --color=always {}'"

# zoxide (cd inteligente) — exige: sudo pacman -S zoxide
command -v zoxide >/dev/null && eval "$(zoxide init bash)"

# starship (prompt com git/python/java) — exige: sudo pacman -S starship
# PS1 antigo: '[\u@\h \W]\$ '
command -v starship >/dev/null && eval "$(starship init bash)"
