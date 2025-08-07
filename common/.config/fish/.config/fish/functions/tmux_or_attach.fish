function tmux_or_attach
    if tmux has-session
        tmux attach
    else
        tmux
    end
end
