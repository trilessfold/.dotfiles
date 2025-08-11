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
                            [")"] = { "history_forward", mode = { "i", "n" } },
                            ["("] = { "history_back", mode = { "i", "n" } },
                        },
                    },
                },
            },
        },
    },
}
