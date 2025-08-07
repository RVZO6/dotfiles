-- local pickers = require("custom.pickers")
return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader><space>",
        function()
          require("snacks").picker.smart()
        end,
        desc = "Smart Picker (Snacks)",
      },
      -- {
      --   "<leader>fd",
      --   function()
      --     pickers.directory_picker_async()
      --   end,
      --   desc = "Find Directories and Change Cwd (cwd)",
      -- },
    },
    opts = {
      image = {
        enabled = true,
      },
      dashboard = {
        -- enabled = false,
        enabled = true,
        preset = {
          header = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗    ██████╗ ████████╗██╗    ██╗
████╗  ██║██║   ██║██║████╗ ████║    ██╔══██╗╚══██╔══╝██║    ██║
██╔██╗ ██║██║   ██║██║██╔████╔██║    ██████╔╝   ██║   ██║ █╗ ██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ██║   ██║███╗██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝   ██║   ╚███╔███╔╝
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝ 
]],
        },
      },
    },
  },
}
