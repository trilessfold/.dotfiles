local colorscheme = require("lazyvim.plugins.colorscheme")
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "rebelot/kanagawa.nvim",
  },
}
