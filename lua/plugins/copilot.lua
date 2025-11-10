return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")

      neocodeium.setup({
        show_label = false,
        silent = true,
      })

      vim.keymap.set("i", "<M-l>", neocodeium.accept)
      vim.keymap.set("i", "<M-k>", neocodeium.accept_word)
      vim.keymap.set("i", "<C-]>", neocodeium.clear)
    end,
  },

  --{
  --  'zbirenbaum/copilot.lua',
  --  cmd = 'Copilot',
  --  event = 'InsertEnter',
  --  opts = {
  --    logger = {
  --      file_log_level = vim.log.levels.TRACE,
  --    },
  --    suggestion = {
  --      enabled = true,
  --      auto_trigger = true,
  --      keymap = {
  --        accept = "<M-l>",
  --        accept_word = "<M-k>",
  --        dismiss = "<C-]>",
  --      }
  --    }
  --  }
  --},
}
