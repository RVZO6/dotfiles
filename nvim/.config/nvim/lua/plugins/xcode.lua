return {
  -- 1. Mason: Ensure all our tools are installed.
  -- This uses a standard opts table, as you suggested.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Swift
        "swiftlint",
        -- Debugging
        "codelldb",
        -- Build tools
        "xcbeautify",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {}, -- enable the default config
      },
    },
  },
  --
  -- 3. Conform (Formatter): Add swiftformat for Swift files.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },

  -- 4. Lint: Add swiftlint for Swift files.
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },

  -- 5. Xcodebuild: The main plugin for interacting with Xcode.
  -- It will be lazy-loaded when you run a command or use a keymap.
  {
    "wojciech-kulik/xcodebuild.nvim",
    ft = "swift",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        -- HACK: why does this stupid plugin only support telescope :(
        config = function()
          -- make it look like snacks picker.
          vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
          vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
          vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
          vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "FloatTitle" })
          vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "FloatTitle" })
          vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "FloatTitle" })
          vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopeFindPre",
            callback = function()
              vim.opt_local.winborder = "none"
              vim.api.nvim_create_autocmd("WinLeave", {
                once = true,
                callback = function()
                  vim.opt_local.winborder = "rounded"
                end,
              })
            end,
          })
        end,
      },
      {
        "MunifTanjim/nui.nvim",
      },
    },
    -- Lazy-load on these commands
    cmd = {
      "XcodebuildBuild",
      "XcodebuildSetup",
      "XcodebuildRun",
      "XcodebuildTest",
      "XcodebuildTestClass",
      "XcodebuildPicker",
      "XcodebuildSelectDevice",
      "XcodebuildSelectTestPlan",
    },
    -- Lazy-load on these keymaps
    keys = {
      { "<leader>cxb", "<cmd>XcodebuildBuild<cr>", desc = "Xcode Build Project", ft = "swift" },
      { "<leader>cxr", "<cmd>XcodebuildRun<cr>", desc = "Xcode Build & Run", ft = "swift" },
      { "<leader>cxt", "<cmd>XcodebuildTest<cr>", desc = "Xcode Run Tests", ft = "swift" },
      { "<leader>cxT", "<cmd>XcodebuildTestClass<cr>", desc = "Run Test Class", ft = "swift" },
      { "<leader>cxp", "<cmd>XcodebuildPicker<cr>", desc = "Xcode Action Picker", ft = "swift" },
      { "<leader>cxS", "<cmd>XcodebuildSetup<cr>", desc = "Xcode Setup", ft = "swift" },
      { "<leader>cxs", "<cmd>XcodebuildSelectScheme<cr>", desc = "Select Scheme", ft = "swift" },
      { "<leader>cxd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device", ft = "swift" },
      { "<leader>cxP", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan", ft = "swift" },
    },
    opts = {
      formatter = "xcbeautify",
      code_coverage = {
        enabled = true,
      },
    },
  },

  -- 6. nvim-dap (Debugger): Also lazy-loaded on keymaps.
  {
    "mfussenegger/nvim-dap",
    ft = "swift",
    optional = true,
    dependencies = { "wojciech-kulik/xcodebuild.nvim" },
    -- Lazy-load on our custom DAP keymaps
    keys = {
      {
        "<leader>dxb",
        function()
          require("xcodebuild.integrations.dap").build_and_debug()
        end,
        desc = "XCode Debug (Build first)",
      },
      {
        "<leader>dxr",
        function()
          require("xcodebuild.integrations.dap").debug_without_build()
        end,
        desc = "Xcode Debug (No Build)",
      },
      {
        "<leader>dxt",
        function()
          require("xcodebuild.integrations.dap").debug_tests()
        end,
        desc = "Debug (Tests)",
      },
    },
    config = function()
      -- This configuration still needs to be in a function because it
      -- involves running code (like getting the adapter path).
      local xcodebuild_dap = require("xcodebuild.integrations.dap")
      local codelldb_path = require("mason-registry").get_package("codelldb"):get_install_path() .. "/adapter/codelldb"
      xcodebuild_dap.setup(codelldb_path)

      -- Auto-configure DAP UI listeners
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
