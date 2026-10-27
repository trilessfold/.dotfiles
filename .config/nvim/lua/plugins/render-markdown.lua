return {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    ft = { "markdown", "quarto" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim"}, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        -- раньше стояло на уровне спеки lazy.nvim и игнорировалось
        render_modes = { "n", "c", "t" },
        pipe_table = {
            -- скруглённые углы рамки; варианты: 'none', 'round', 'double', 'heavy'
            preset = "round",
            -- 'trimmed': выравнивать по видимой ширине без лишних пробелов из исходника
            cell = "trimmed",
            -- вписывать широкую таблицу в окно, перенося текст внутри ячеек
            wrap = true,
            padding = 1,
            min_width = 3,
            -- верх/низ рамки виртуальными строками, а не захватом пустых строк вокруг
            border_virtual = true,
        },
        -- таблица шире окна без переноса не спасается: показываем сырой markdown
        anti_conceal = {
            enabled = true,
            above = 0,
            below = 0,
        },
        latex = { enabled = false },
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
                icon = "",
                highlight = "RenderMarkdownSuccess",
                scope_highlight = nil,
            },
            custom = {
                arrow = {raw = "[>]",  rendered = "", highlight = "RenderMarkdownWarn"},
                tilde = {raw = "[~]",  rendered = "󰰱", highlight = "RenderMarkdownHint"},
                important = {raw = "[!]",  rendered = "", highlight = "RenderMarkdownError"},
            },
            scope_priority = nil,
        },
    },
}
