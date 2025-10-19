# Homebrew PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin' | prepend '/opt/homebrew/sbin')

# BOB PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.local/share/bob/nvim-bin")

# Editor
$env.EDITOR = 'nvim'

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
