return {
  -- Installs vim-jack-in and its dependency vim-dispatch
  {
    "clojure-vim/vim-jack-in",
    dependencies = { "tpope/vim-dispatch", "radenling/vim-dispatch-neovim" }, -- includes Neovim specific dispatch
    ft = { "clojure", "clojurescript", "fennel" }, -- Only load for these filetypes
  },
}
