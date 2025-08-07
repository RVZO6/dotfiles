set -Ux BUN_INSTALL "$HOME/.bun"
set -Ux UV_PYTHON_PREFERENCE managed
set -Ux SKIM_DEFAULT_COMMAND fd
set -Ux XDG_CONFIG_HOME "$HOME/.config"

fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.local/scripts"
fish_add_path "$HOME/.local/share/bob/nvim-bin"

switch (uname)
    case Darwin
        source "$XDG_CONFIG_HOME/fish/conf.d/02_macos.fish"
    case Linux
        source "$XDG_CONFIG_HOME/fish/conf.d/02_linux.fish"
end

set -Ux EDITOR nvim
fish_add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
fish_add_path "$ANDROID_HOME/platform-tools"
fish_add_path "$ANDROID_HOME/emulator"
fish_add_path "$ANDROID_HOME/tools"
fish_add_path "$ANDROID_HOME/tools/bin"
