if not vim.g.neovide then
  return
end

local M = {}

function M.setup()
  -- Font
  vim.o.guifont = "JetBrainsMono Nerd Font:h16"

  -- Padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_left = 21
  vim.g.neovide_padding_right = 21

  -- Transparency & blur (macOS)
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- Input & Visual
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

return M
