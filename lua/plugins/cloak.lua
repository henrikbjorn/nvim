return {
  {
    'laytan/cloak.nvim',
    event = 'BufRead',
    opts = {},
    keys = {
      { '<leader>ct', '<cmd>CloakToggle<CR>', desc = 'Cloak Toggle' },
    }
  }
}
