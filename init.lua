-- ~/.config/nvim/init.lua

-- Load Lazy bootstrap / plugin setup
require("config.lazy")

----------------------------------------------------------------------
-- Core Neovim options
----------------------------------------------------------------------

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = truj

-- Files
vim.opt.fileformats = {"unix", "dos"}
vim.opt.fileformat = "unix"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/templates/*.yaml",
  callback = function()
    vim.bo.filetype = "helm"
  end,
})


----------------------------------------------------------------------
-- Keymaps
----------------------------------------------------------------------
local map = vim.keymap.set
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })


