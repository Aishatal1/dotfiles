# ~/.bashrc — Portable version
# Works on any system

# ──────────────────────────────────────────────
# PATH — Use $HOME, not hardcoded paths
# ──────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# ──────────────────────────────────────────────
# If not running interactively, don't do anything
# ──────────────────────────────────────────────

[[ $- != *i* ]] && return

# ──────────────────────────────────────────────
# Colors
# ──────────────────────────────────────────────

if [ -f ~/.dircolors ]; then
    eval "$(dircolors ~/.dircolors)"
    export LS_COLORS=$(dircolors ~/.dircolors | grep -o '"[^"]*"' | tr -d '"')
fi

# ──────────────────────────────────────────────
# Aliases
# ──────────────────────────────────────────────

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
# Git aliases
# ──────────────────────────────────────────────

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# ──────────────────────────────────────────────
# Prompt
# ──────────────────────────────────────────────

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# ──────────────────────────────────────────────
# XDG Data Dirs
# ──────────────────────────────────────────────

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
