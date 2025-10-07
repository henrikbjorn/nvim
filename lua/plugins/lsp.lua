return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    event = {
      "BufReadPre",
      "BufNewFile"
    },
    opts = {
      automatic_enable = true
    },
    init = function ()
      vim.lsp.enable('flow')
    end,
  },
}
