-- parinfer written in rust. basically generates/closes the brackets based on indentation

-- return {
--   {
--     "eraserhd/parinfer-rust",
--     build = "cargo build --release",
-- Optional: Add configuration or keymaps here
-- config = function()
--   -- Example configuration (refer to parinfer-rust docs for full options)
--   vim.cmd([[autocmd FileType clojure,lisp,scheme,fennel ParinferToggle]])
-- end,
--   },
-- }

return {
  "gpanders/nvim-parinfer",
}
