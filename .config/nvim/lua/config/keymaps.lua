-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", {desc = "Open Diffview"})
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", {desc = "Buffer blame (fugitive)"})
vim.keymap.set("n", "<leader>gB", "<cmd>.DiffviewFileHistory <cr>", {desc = "Line history"})
vim.keymap.set("n", "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", {desc = "File history"})
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", {desc = "Git status (fugitive)"})
