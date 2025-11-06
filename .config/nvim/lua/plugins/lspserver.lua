return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "[[", false } -- Unbind specific key
            keys[#keys + 1] = { "]]", false }
        end,
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
