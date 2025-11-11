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
                            ["<A-[>"] = { "history_forward", mode = { "i", "n" } },
                            ["<A-]>"] = { "history_back", mode = { "i", "n" } },
                        },
                    },
                },
            },
        },
    },
}
