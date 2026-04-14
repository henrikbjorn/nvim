return {
  -- {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   event = 'VeryLazy',
  --   config = function() end,
  -- },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
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
      })
    end,
  },
}
