local possible_dirs = {
  "/Applications/Ghostty.app/Contents/Resources/vim/vimfiles/", -- macOS
  "/usr/share/ghostty/vim/vimfiles/", -- Arch Linux
  "/usr/local/share/ghostty/vim/vimfiles/", -- Alternative Linux path
}

local function find_ghostty_dir()
  for _, dir in ipairs(possible_dirs) do
    if vim.fn.isdirectory(dir) == 1 then
      return dir
    end
  end
  return nil
end

return {
  "ghostty",
  dir = find_ghostty_dir(),
  lazy = false,
  cond = find_ghostty_dir() ~= nil,
}
