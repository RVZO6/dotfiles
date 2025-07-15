# --------------------------------------------------------------------
#  Initial Setup
# --------------------------------------------------------------------
# Enable Vi-style keybindings in the shell.
fish_vi_key_bindings
# Suppress the default greeting message.
set fish_greeting

# --------------------------------------------------------------------
#  Environment and PATH
# --------------------------------------------------------------------
# Set global, exported environment variables.
set -gx BUN_INSTALL "$HOME/.bun"
set -gx UV_PYTHON_PREFERENCE managed
set -gx SKIM_DEFAULT_COMMAND fd
export XDG_CONFIG_HOME="$HOME/.config"

# Add directories to the PATH. fish_add_path handles duplicates.
fish_add_path -p $HOME/.bun/bin
fish_add_path -p "$HOME/.local/scripts"

# OS-specific PATH adjustments and tool initializations
switch (uname)
    case Darwin
        # macOS-specific settings
        fish_add_path -p /opt/homebrew/bin
        fish_add_path /Users/ryan/.spicetify

        # Set JAVA_HOME if Java 17 is available
        if command -v /usr/libexec/java_home >/dev/null
            set -l java_home_path (/usr/libexec/java_home -v 17 2> /dev/null)
            if test -n "$java_home_path"
                set -gx JAVA_HOME $java_home_path
            end
        end
    case Linux
        # Linux-specific settings
        # IMPORTANT: Initialize Homebrew on Linux
        if test -e /home/linuxbrew/.linuxbrew/bin/brew
            eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        end

        # Set JAVA_HOME if Java is available.
        if command -v java >/dev/null
            set -l java_path (readlink -f (command -v java))
            if test -n "$java_path"
                set -gx JAVA_HOME (dirname (dirname $java_path))
            end
        end
end

# --------------------------------------------------------------------
#  Tool Initialization
# --------------------------------------------------------------------
# Initialize Starship prompt if available
if command -v starship >/dev/null
    starship init fish | source
end

# Initialize Zoxide (smarter cd) if available
if command -v zoxide >/dev/null
    zoxide init fish | source
end

# --------------------------------------------------------------------
#  Aliases
# --------------------------------------------------------------------
function lazyvim
    env NVIM_APPNAME=lazyvim nvim $argv
end

# --------------------------------------------------------------------
#  Keybindings
# --------------------------------------------------------------------
# Accept autosuggestion with Tab in insert mode
bind -M insert \t accept-autosuggestion

# Open the tmux sessionizer with Ctrl+F
bind \cf "~/.config/scripts/tmux-sessionizer"

function show-completions
    commandline -f complete
end

bind \cg show-completions

# CONFLICTING BINDINGS REMOVED:
# The original Ctrl+J and Ctrl+K bindings for history were removed
# as they interfere with tmux/vim pane navigation hotkeys.
# Use Up/Down arrows or K/J in normal mode for history.

# --------------------------------------------------------------------
#  Functions & Event Handlers
# --------------------------------------------------------------------
# Automatically source a Python virtual environment if found.
# This runs every time the prompt is about to be displayed.
function __check_and_activate_venv --on-event fish_prompt
    if not set -q VIRTUAL_ENV
        if test -f ./venv/bin/activate.fish
            source ./venv/bin/activate.fish
        else if test -f ./.venv/bin/activate.fish
            source ./.venv/bin/activate.fish
        end
    end
end
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

export XDG_CONFIG_HOME="$HOME/.config"

# pnpm
set -gx PNPM_HOME /Users/ryan/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Add libpq to PATH
fish_add_path /opt/homebrew/opt/libpq/bin

# Compiler flags for libpq
set -gx LDFLAGS -L/opt/homebrew/opt/libpq/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/libpq/include

# Pkg-config path for libpq
set -gx PKG_CONFIG_PATH /opt/homebrew/opt/libpq/lib/pkgconfig
