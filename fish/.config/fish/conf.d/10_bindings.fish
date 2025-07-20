function tmux_or_attach
    if tmux has-session
        tmux attach
    else
        tmux
    end
end

bind \ct tmux_or_attach
bind -M insert \ct tmux_or_attach

bind -M insert \t accept-autosuggestion
bind \cf "~/.config/scripts/tmux-sessionizer"

function show-completions
    commandline -f complete
end

bind \cg show-completions
