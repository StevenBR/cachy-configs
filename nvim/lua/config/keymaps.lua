-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- moves line up and down:is included with selecting line, then using alt+hjkl
-- don't necisarrily need
-- vim.keymap.set("n", "<C-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- vim.keymap.set("n", "<C-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })

-- local function map(mode, lhs, rhs, opts)
--   vim.keymap.set(mode, lhs, rhs, opts or { silent = true })
-- end

-- recommended mappings (for smart-splits plugin)
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-H>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-J>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-K>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-L>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<A-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<A-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
