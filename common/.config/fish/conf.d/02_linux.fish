# Linux-specific settings
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if command -v java >/dev/null
    set -l java_path (readlink -f (command -v java))
    if test -n "$java_path"
        set -Ux JAVA_HOME (dirname (dirname $java_path))
    end
end
