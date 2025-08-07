if test (uname) = Darwin
    # macOS-specific settings
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

    set -Ux PNPM_HOME "$HOME/Library/pnpm"
    set -Ux ANDROID_HOME "/opt/homebrew/share/android-commandlinetools"

    fish_add_path "$HOME/.spicetify"
    fish_add_path "$PNPM_HOME"
end
