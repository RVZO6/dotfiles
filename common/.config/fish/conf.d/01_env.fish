set -gx BUN_INSTALL "$HOME/.bun"
set -gx UV_PYTHON_PREFERENCE managed
set -gx SKIM_DEFAULT_COMMAND fd
set -g XDG_CONFIG_HOME "$HOME/.config"

fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.local/scripts"
fish_add_path "$HOME/.local/share/bob/nvim-bin"

set -gx EDITOR nvim
fish_add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
fish_add_path "$ANDROID_HOME/platform-tools"
fish_add_path "$ANDROID_HOME/emulator"
fish_add_path "$ANDROID_HOME/tools"
fish_add_path "$ANDROID_HOME/tools/bin"
