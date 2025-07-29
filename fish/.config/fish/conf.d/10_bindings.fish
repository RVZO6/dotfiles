function tmux_or_attach
    if tmux has-session
        tmux attach
    else
        tmux
    end
end

bind \ct tmux_or_attach
bind \cf "~/.config/scripts/tmux-sessionizer"

# nvim completion bindings
bind \cn next-completion
bind \cp prev-completion
set -U fifc_keybinding \cg

# Accept autosuggestion with Tab

bind -M insert \t accept-autosuggestion

# In normal/default (vi normal) mode: Tab accepts suggestion from prompt
bind -M default \t accept-autosuggestion
