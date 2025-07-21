return {
  "saghen/blink.cmp",
  -- NOTE: only becuase noice is disabled
  event = { "InsertEnter", "CmdlineEnter" },
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "default",
    },
    -- NOTE: only becuase noice is disabled
    cmdline = {
      enabled = true,
      keymap = {
        preset = "inherit",
        ["<Tab>"] = { "show", "fallback" },
      },
    },
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },

      documentation = {
        window = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        },
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = { enabled = false },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        winhighlight = "FloatBorder:FloatBorder",
      },
    },
  },
}
