local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match("%s") == nil
end

return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '*',
    opts = {
      keymap = {
        preset = 'none', -- We'll define our own mappings to match your nvim-cmp behavior

        -- Tab behavior that matches your current nvim-cmp setup
        ['<Tab>'] = {
          function(cmp)
            -- If completion menu is visible, select next item
            if cmp.is_visible() then
              return cmp.select_next()
            end
            -- If we have words before cursor, trigger completion
            if has_words_before() then
              return cmp.show()
            end
            -- Otherwise, fallback to normal Tab
          end,
          'fallback'
        },

        -- Shift-Tab to select previous item
        ['<S-Tab>'] = { 'select_prev', 'fallback' },

        -- Accept completion with Enter
        ['<CR>'] = { 'accept', 'fallback' },

        -- Hide completion with Escape
        ['<C-e>'] = { 'hide', 'fallback' },

        -- Show completion with Ctrl-Space
        ['<C-space>'] = { 'show', 'fallback' },
      },

      completion = {
        trigger = {
          -- Completely disable automatic completion
          show_on_insert_on_trigger_character = false,
          show_on_keyword = false,
          show_on_trigger_character = false,
          show_in_snippet = false,
        },

        menu = {
          auto_show = false, -- Never auto-show the menu
        },

        list = {
          selection = {
            preselect = false,  -- Don't auto-select first item
            auto_insert = false, -- Don't auto-insert on selection
          },
        },
      },

      sources = {
        default = { 'lsp', 'buffer', 'path' },
      },
    },
  },
}
