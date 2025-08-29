return {
  {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        keys[#keys + 1] = { "[[", false } -- Unbind specific key
        keys[#keys + 1] = { "]]", false }
    end,
    opts = {
      autoformat = false,
    },
  },
}
