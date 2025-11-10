
return {
  {
    {
      "ellisonleao/gruvbox.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },

    -- Remember last line when re-opening files
    {
      'vladdoster/remember.nvim',
      event = 'BufRead',
      opts = {},
    }
  }
}
