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
            },
            inline_hints = { enabled = true },
            autoformat = false,
        },
    },
    {
        "VPavliashvili/json-nvim",
    },
}
