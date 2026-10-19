return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      --   was trying to change the hidden toggle in the explorer, keeping the commented config as an example
      -- toggles = {
      --   follow = "f",
      --   hidden = "H",
      --   ignored = "i",
      --   modified = "m",
      --   regex = { icon = "R", value = false },
      -- },
      -- win = {
      --   input = {
      --     keys = {
      --       -- Hidden
      --       ["H"] = { "toggle_hidden", mode = { "i", "n" } },
      --       ["<a-h>"] = false,
      --     },
      --   },
      --   list = {
      --     keys = {
      --       ["H"] = { "toggle_hidden", mode = { "i", "n" } },
      --       ["<a-h>"] = false,
      --     },
      --   },
      -- },
      formatters = {
        file = {
          filename_first = true,
        },
      },
      sources = {
        files = {
          hidden = true,
        },
        explorer = {
          layout = { layout = { position = "right" } },
          -- layout = { layout = { position = "float" } },
          follow_file = false,
          jump = { close = false },
          supports_live = false,
          git_status = true,
          win = {
            list = {
              keys = {
                -- ["meta-h"] = { "C-H", expr = true, "toggle_hidden", mode = { "i", "n" } },
                ["H"] = { "toggle_hidden", mode = { "i", "n" } },
                ["<a-h>"] = false,
              },
            },
          },
        },
      },
    },
  },
}
