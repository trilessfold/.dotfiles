-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*" },
    callback = function()
        vim.b.autoformat = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "git" },
    callback = function()
        vim.opt_local.foldmethod = "syntax"
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("ResolveSymlinks", { clear = true }),
    callback = function()
        local buf = 0
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })

        -- Пропускаем небуквальные буферы (help, quickfix, nofile, etc.)
        if buftype ~= "" then
            return
        end

        local current = vim.api.nvim_buf_get_name(buf)
        if current == "" then
            return
        end

        -- Проверяем, что файл существует на диске
        if vim.fn.filereadable(current) ~= 1 then
            return
        end

        local resolved = vim.fn.resolve(current)
        vim.cmd("file " .. resolved)
    end,
})
