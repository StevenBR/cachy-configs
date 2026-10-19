return {
  "Olical/conjure",
  ft = { "clojure", "fennel", "janet", "typescript", "javascript" }, -- Or any other filetypes you want Conjure for
  config = function()
    -- Your Conjure specific configuration goes here
    -- For example, to integrate with nvim-cmp:
    -- if require("lazy.core.config").plugins["nvim-cmp"] then
    --   local cmp = require("cmp")
    --   local sources = cmp.get_sources()
    --   table.insert(sources, { name = "conjure" })
    --   cmp.setup.sources(sources)
    -- end
  end,
}
