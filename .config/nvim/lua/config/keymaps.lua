-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>gb", "<cmd>Guit blame<cr>", { desc = "Buffer blame" })
vim.keymap.set("n", "<leader>gB", "<cmd>.DiffviewFileHistory <cr>", { desc = "Line history" })
vim.keymap.set("n", "<leader>gF", "<cmd>Guit history %<cr>", { desc = "File history" })
vim.keymap.set("n", "<leader>gl", "<cmd>Guit log %<cr>", { desc = "File history" })
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>0,3Git blame<cr>", { desc = "Open commit of line (fugitive)" })
vim.keymap.set("n", "<A-h>", "<cmd>normal! H<cr>")
vim.keymap.set("n", "<A-l>", "<cmd>normal! L<cr>")
vim.keymap.set("n", "<A-m>", "<cmd>normal! M<cr>")

