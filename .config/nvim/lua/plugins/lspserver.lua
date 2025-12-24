return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                elp = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern("cwd")(...)
                    end,
                },
                elixirls = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern("mix.exs")(...)
                    end,
                },
            },
            inline_hints = {enabled = true},
            autoformat = false,
        },
    },
}
