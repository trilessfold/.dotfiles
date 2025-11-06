return {
    --    {
    --        "nvim-treesitter/playground",
    --    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_loaded = {
                "erlang",
            },
            textobjects = {
                move = {
                    enable = false,
                },
            },
        },
    },
}
