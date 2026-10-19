return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Customize options for clojure-lsp here
      ["clojure_lsp"] = {
        -- Example: Pass specific initialization options
        -- init_options = {
        --   -- your options here
        -- },
      },
    },
  },
}
