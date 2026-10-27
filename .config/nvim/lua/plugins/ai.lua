return {
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        opts = {
            terminal_cmd = "eltex-claude", -- Point to local installation
        },
        config = true,
        keys = {
            -- Your keymaps here
        },
    },
}
