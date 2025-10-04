# ----------------------------
# Environment
# ----------------------------
# Homebrew (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"
# Local bin first
export PATH="$HOME/.local/bin:$PATH"

# ----------------------------
# Syntax Highlighting & Autosuggestions
# (MUST be set BEFORE the plugin is sourced)
# ----------------------------
# declare styles container
typeset -g -A ZSH_HIGHLIGHT_STYLES

# autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Enable highlighters (include 'pattern' so we can match arguments)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern)

# Main highlighter styles
ZSH_HIGHLIGHT_STYLES=(
  [default]='none'
  [command]='fg=white'                  # main command (e.g. git, brew)
  [builtin]='fg=white'
  [function]='fg=white'
  [alias]='fg=white'
  [reserved-word]='none'
  [single-hyphen-option]='fg=green'     # -x
  [double-hyphen-option]='fg=green'     # --long
  [path]='fg=cyan,underline'
  [path_pathseparator]='fg=cyan,underline'
  [globbing]='fg=14'
  [history-expansion]='fg=14'
  [single-quoted-argument]='fg=yellow'
  [double-quoted-argument]='fg=yellow'
  [dollar-quoted-argument]='fg=yellow'
  [commandseparator]='fg=green'
  [redirection]='fg=cyan,bold'
  [comment]='fg=red'
  [assign]='fg=cyan'
  [unknown-token]='fg=9,bold'
  [region]='fg=7,bold'                  # visual selection (light grey)
)

# Pattern-based highlighting:
# - any token preceded by whitespace will be colored cyan
#   (this effectively highlights subcommands & arguments)
ZSH_HIGHLIGHT_PATTERNS+=('[[:space:]][^[:space:]]+' 'fg=cyan')

# ----------------------------
# Plugin Manager (Sheldon)
# ----------------------------
# Source Sheldon AFTER ZSH_HIGHLIGHT_* variables are set so zsh-syntax-highlighting can read them
eval "$(sheldon source)"

# ----------------------------
# Starship Prompt
# ----------------------------
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# ----------------------------
# zoxide (directory jumper)
# ----------------------------
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# ----------------------------
# Aliases
# ----------------------------
command -v eza >/dev/null 2>&1 && alias ls="eza -lh --group-directories-first --icons=auto"
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# Modern replacements
command -v bat >/dev/null 2>&1 && alias cat="bat"
command -v fd >/dev/null 2>&1 && alias find="fd"
command -v rg >/dev/null 2>&1 && alias grep="rg"

# ----------------------------
# Keybindings
# ----------------------------
# zsh-vi-mode compatible keybindings
function zvm_after_init() {
  # Tab for autosuggestions, fallback to completion if no suggestion
  bindkey '^I' autosuggest-accept  # Tab for autosuggestions
  # Ctrl-G for normal tab completion (what Tab normally does)
  bindkey '^G' complete-word  # Ctrl-G for completions
}

# Custom function to handle Tab behavior
autosuggest-accept-or-complete() {
  if [[ -n $POSTDISPLAY ]]; then
    zle autosuggest-accept
  else
    zle expand-or-complete
  fi
}
zle -N autosuggest-accept-or-complete

# ----------------------------
# History Configuration
# ----------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ----------------------------
# Basic Completion
# ----------------------------
autoload -Uz compinit
compinit
LISTMAX=10000
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu yes select

# ----------------------------
# Shell Options
# ----------------------------
setopt AUTO_CD
setopt NO_BEEP

# ----------------------------
# Helper functions
# ----------------------------
mkcd() { mkdir -p "$1" && cd "$1" }

extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

