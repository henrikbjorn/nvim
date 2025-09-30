return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'VeryLazy',
    config = function() end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "css",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "ruby",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },

        indent = {
          enable = true
        },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
}
