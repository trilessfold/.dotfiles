local obsidian = require "plugins.obsidian"
return {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    render_modes = { "n", "c", "t" },
    ft = { "markdown", "quarto" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim"}, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        checkbox = {
            enabled = true,
            render_modes = false,
            bullet = false,
            left_pad = 0,
            right_pad = 1,
            unchecked = {
                icon = "󰄱",
                highlight = "RenderMarkdownWarn",
                scope_highlight = nil,
            },
            checked = {
                icon = "",
                highlight = "RenderMarkdownSuccess",
                scope_highlight = nil,
            },
            custom = {
                arrow = {raw = "[>]",  rendered = "", highlight = "RenderMarkdownWarn"},
                tilde = {raw = "[~]",  rendered = "󰰱", highlight = "RenderMarkdownHint"},
                important = {raw = "[!]",  rendered = "", highlight = "RenderMarkdownError"},
            },
            scope_priority = nil,
        },
    },
}
