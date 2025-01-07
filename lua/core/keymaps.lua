vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.smarttab       = true
vim.opt.mouse          = a
vim.opt.cursorline     = true

vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})


vim.opt.list           = true
vim.opt.listchars      ="tab:>-"

vim.opt.undofile       = true
