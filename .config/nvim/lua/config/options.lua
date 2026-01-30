-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("set background=dark")
vim.cmd("set t_Co=256")
vim.cmd("set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz")

vim.opt.spelllang = 'en,ru'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.diffopt:append({
  "vertical",            -- вертикальный split
  "iwhite",
  "filler",
  "closeoff",
  "algorithm:myers",
  "inline:char",
  "context:5",
  "linematch:100",
  "indent-heuristic",    -- лучшее выравнивание блоков
})

vim.g.autoformat = false
vim.b.autoformat = false

