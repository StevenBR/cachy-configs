return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      -- {
      --   "akinsho/bufferline.nvim",
      --   optional = true,
      --   opts = function(_, opts)
      --     if (vim.g.colors_name or ""):find("catppuccin") then
      --       opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      --     end
      --   end,
      -- },
    },
  },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    -- config = function(plugin)
    --   vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    --   vim.cmd([[colorscheme aura-dark]])
    -- end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    options = {
      -- transparent = true,
      transparent = true, -- Disable setting bg (make neovim's background transparent)
      terminal_colors = true,
    },
    -- config = function()
    --   require("github-theme").setup({
    --     options = {
    --       transparent = true, -- Disable setting bg (make neovim's background transparent)
    --       -- set_vim_background = true, -- Disable setting bg (make neovim's background transparent)
    --     },
    --     -- ...
    --   })
    --
    --   vim.cmd("colorscheme github_dark")
    -- end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    -- opts = { style = "night" },
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "Vallen217/eidolon.nvim",
    lazy = false,
    -- opts = { style = "night" },
  },
  {
    "frenzyexists/aquarium-vim",
    lazy = false,
    -- opts = { style = "night" },
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
  },
  { "Shatur/neovim-ayu" },
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      end
    end,
  },
  {
    "Aejkatappaja/sora",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("sora").setup(opts)
      -- vim.cmd("colorscheme sora")
    end,
  },
  {
    "mryodo/rwth.nvim", -- Replace with the exact repository if different
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional setup or colorscheme load command
      -- vim.cmd([[colorscheme rwth]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_tritanopia",
      -- colorscheme = "monoglow",
      -- colorscheme = "eidolon",
      -- colorscheme = "catppuccin",
      colorscheme = "tokyonight-storm",
      -- colorscheme = "sora",
      -- colorscheme = "tokyonight-storm",
      -- colorscheme = "github_dark_default",
    },
  },
}
