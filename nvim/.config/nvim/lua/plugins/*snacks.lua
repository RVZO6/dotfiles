return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>E", false },
      {
        "<leader><space>",
        function()
          require("snacks").picker.smart()
        end,
        desc = "Smart Picker (Snacks)",
      },
    },
    opts = {
      explorer = { enabled = false },
      indent = { enabled = false },
      statuscolumn = { enabled = false },
      dashboard = {
        -- enabled = false,
        enabled = true,
        preset = {
          header = [[
                   888      888      888      888     
         888      888      888      888      888      
         888      888      888      888      888      
888  888 88888b.  88888b.  88888b.  88888b.  88888b.  
888  888 888 "88b 888 "88b 888 "88b 888 "88b 888 "88b 
888  888 888  888 888  888 888  888 888  888 888  888 
Y88b 888 888  888 888  888 888  888 888  888 888  888 
 "Y88888 888  888 888  888 888  888 888  888 888  888 
          ]],
        },
      },
    },
  },
}
