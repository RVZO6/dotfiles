-- ~/.config/nvim/lua/plugins/lint.lua
local HOME = os.getenv("HOME")

return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
