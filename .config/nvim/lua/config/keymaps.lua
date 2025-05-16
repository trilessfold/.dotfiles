-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Buffer blame (fugitive)" })
vim.keymap.set("n", "<leader>gB", "<cmd>.DiffviewFileHistory <cr>", { desc = "Line history" })
vim.keymap.set("n", "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history" })
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status (fugitive)" })

vim.keymap.set("n", "<C-O>", function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local is_fugitive = bufname:match("^fugitive://")
    local is_diff = vim.wo.diff

    if is_fugitive or is_diff then
        -- Останавливаем вставку, если она есть
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("dq", true, false, true), "m", false)
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-O>", true, false, true), "n", false)
end, { noremap = true, silent = true, desc = "Smart Ctrl-O fugitive diff exit" })
