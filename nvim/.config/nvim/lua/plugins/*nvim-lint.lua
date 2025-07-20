-- ~/.config/nvim/lua/plugins/lint.lua
local HOME = os.getenv("HOME")

return {
  "mfussenegger/nvim-lint",
  dependencies = "folke/snacks.nvim",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
    },
  },
}
