# ~/.bashrc — Aisha's Custom Config
# Source: https://github.com/Aishatal1/dotfiles

# ──────────────────────────────────────────────
# General settings
# ──────────────────────────────────────────────

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ──────────────────────────────────────────────
# PATH
# ──────────────────────────────────────────────

export PATH="$PATH:/home/aisha/.local/bin"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir' 2>/dev/null)"
export PATH="$PATH:$GEM_HOME/bin"

# ──────────────────────────────────────────────
# Colors
# ──────────────────────────────────────────────

# Custom dircolors (high contrast, unique colors)
eval "$(dircolors ~/.dircolors)"

# Ensure LS_COLORS is available everywhere
export LS_COLORS=$(dircolors ~/.dircolors | grep -o '"[^"]*"' | tr -d '"')

# ──────────────────────────────────────────────
# Aliases
# ──────────────────────────────────────────────

# Modern ls with lsd (if installed)
if command -v lsd &> /dev/null; then
    alias ls='lsd --color=auto --group-directories-first -lFthv'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -la'
alias la='ls -A'
alias l='ls -l'
alias grep='grep --color=auto'
alias tree='lsd --tree 2>/dev/null || tree'

# ──────────────────────────────────────────────
# Custom PS1 (Prompt)
# ──────────────────────────────────────────────

# Colored prompt: user@host:path
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# ──────────────────────────────────────────────
# Git aliases (if you want)
# ──────────────────────────────────────────────

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# ──────────────────────────────────────────────
# XDG Data Dirs (Flatpak, etc.)
# ──────────────────────────────────────────────

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/aisha/.local/share/flatpak/exports/share"

