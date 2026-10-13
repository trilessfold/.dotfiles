return {
    {
        "tpope/vim-fugitive",
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "folke/snacks.nvim", -- optional
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
        },
    },
    {
        dir = "~/dev/nvim-plugins/Guit.nvim",
        dependencies = { "tpope/vim-fugitive" },
        config = function()
            require("guit").setup({
                blame = {
                    mode = 'heat', -- color | plain | heat
                    width = 32,
                },
                diff = {
                    mode = 'inline', -- split | inline: what dd opens
                },
            })
        end,
    },
}
