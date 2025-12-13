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
}
