set -Ux BUN_INSTALL "$HOME/.bun"
set -Ux UV_PYTHON_PREFERENCE managed
set -Ux SKIM_DEFAULT_COMMAND fd
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux PNPM_HOME /Users/ryan/Library/pnpm
set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/temurin-24.jdk/Contents/Home"

fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.local/scripts"
fish_add_path "/Users/ryan/.spicetify"
fish_add_path "$PNPM_HOME"
fish_add_path "$HOME/.local/share/bob/nvim-bin"

switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/opt/libpq/bin

        if command -v /usr/libexec/java_home >/dev/null
            set -l java_home_path (/usr/libexec/java_home -v 17 2>/dev/null)
            if test -n "$java_home_path"
                set -Ux JAVA_HOME $java_home_path
            end
        end

        set -Ux LDFLAGS -L/opt/homebrew/opt/libpq/lib
        set -Ux CPPFLAGS -I/opt/homebrew/opt/libpq/include
        set -Ux PKG_CONFIG_PATH /opt/homebrew/opt/libpq/lib/pkgconfig

    case Linux
        # IMPORTANT: Initialize Homebrew on Linux
        if test -e /home/linuxbrew/.linuxbrew/bin/brew
            eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        end

        if command -v java >/dev/null
            set -l java_path (readlink -f (command -v java))
            if test -n "$java_path"
                set -Ux JAVA_HOME (dirname (dirname $java_path))
            end
        end
end

set -Ux EDITOR nvim
set -Ux ANDROID_HOME "/opt/homebrew/share/android-commandlinetools"
fish_add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
fish_add_path "$ANDROID_HOME/platform-tools"
fish_add_path "$ANDROID_HOME/emulator"
fish_add_path "$ANDROID_HOME/tools"
fish_add_path "$ANDROID_HOME/tools/bin"