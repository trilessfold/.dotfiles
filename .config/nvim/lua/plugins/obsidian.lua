return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "dailies",
            -- Optional, default tags to add to each new daily note created.
            default_tags = { "daily-notes" }
        },
        ui = {
            enable = false,
        },
        legacy_commands = false, -- this will be removed in the next major release
        workspaces = {
            {
                path = "~/Documents/Abrakadabra",
            },
        },
    },
}
