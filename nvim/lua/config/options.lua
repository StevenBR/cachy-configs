-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ","

-- for vim-tmux-navigator not sure if I actually need it
-- vim.g.tmux_navigator_no_mappings = 1

-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt
-- sets line marker
-- opt.colorcolumn = "80"
opt.textwidth = 80
opt.colorcolumn = "+1" -- Marker appears 1 column after textwidth

-- Set global options for 4-space indentation
opt.tabstop = 4 -- Number of spaces a <Tab> in the file counts for
opt.shiftwidth = 4 -- Number of spaces to use for auto-indent
opt.softtabstop = 4 -- Number of spaces a <Tab> inserts when in insert mode
opt.expandtab = true -- Convert <Tab> to spaces

-- opt.guicursor = "n-v-c:block,i-ci:ver25-blinkwait500-blinkon400-blinkoff400"
-- opt.guicursor = "n-v-c:block,i-ci:ver25-blinkwait500-blinkon500-blinkoff500"
opt.guicursor = "n-v-c:block-blinkwait100-blinkon500-blinkoff500,i-ci:ver25-blinkwait100-blinkon500-blinkoff500"
