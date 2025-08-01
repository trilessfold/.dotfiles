return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                sources = {
                    files = {
                        hidden = true,
                        ignored = true
                    },
                },
                hidden = true,
                ignored = true,
                win = {
                    input = {
                        keys = {
                            ["<c-n>"] = { "history_forward", mode = { "i", "n" } },
                            ["<c-p>"] = { "history_back", mode = { "i", "n" } },
                        },
                    },
                },
            },
        },
    },
}
