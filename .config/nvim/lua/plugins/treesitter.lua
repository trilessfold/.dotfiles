return {
    --    {
    --        "nvim-treesitter/playground",
    --    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "erlang"
            },
            textobjects = {
                move = {
                    enable = false,
                },
            },
        },
    },
}
