return {
  "saghen/blink.cmp",
  -- NOTE: only becuase noice is disabled
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    -- Blink.cmp calls this function to check "Should I be enabled right now?"
    -- vim.b.completion ~= false means: only OFF when explicitly set to false, otherwise ON
    -- nil (default) → ON, true → ON, false → OFFbuffer local var. completion should
    enabled = function()
      return vim.b.completion ~= false
    end,
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
