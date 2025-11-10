-- Custom function to get current line diagnostic message (similar to lualine setup)
local function get_current_diagnostic_string()
  local bufnr = 0
  local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
  local opts = { ["lnum"] = line_nr }

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then
    return ''
  end

  local best_diagnostic = nil
  for _, diagnostic in ipairs(line_diagnostics) do
    if best_diagnostic == nil or diagnostic.severity < best_diagnostic.severity then
      best_diagnostic = diagnostic
    end
  end

  if not best_diagnostic or not best_diagnostic.message then
    return ''
  end

  local message = vim.split(best_diagnostic.message, "\n")[1]
  local max_width = vim.api.nvim_win_get_width(0) - 35

  if string.len(message) < max_width then
    return message
  else
    return string.sub(message, 1, max_width) .. "..."
  end
end

return {
  {
    'nvim-mini/mini.ai',
    event = 'VeryLazy',
    opts = function ()
      local ai = require('mini.ai')

      return {
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }, {}),
          f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
          c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
        },
      }
    end,
  },
  {
    'nvim-mini/mini.diff',
    event = {
      "BufReadPost",
      "BufNewFile",
      "BufWritePre",
    },
    opts = {},
  },
  {
    'nvim-mini/mini.comment',
    lazy = true,
    opts = {
    },
  },
  {
    'nvim-mini/mini.surround',
    lazy = true,
    opts = {},
  },
  {
    'nvim-mini/mini.icons',
    lazy = true,
    opts = {},
  },
  {
    'nvim-mini/mini.statusline',
    dependencies = { 'nvim-mini/mini.icons' },
    version = '*',
    event = 'VeryLazy',
    opts = {
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location      = MiniStatusline.section_location({ trunc_width = 1 }) -- Force the "Short" format
          local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

          return MiniStatusline.combine_groups({
            { hl = mode_hl,                  strings = { mode } },
            { hl = 'MiniStatuslineDevinfo',  strings = { get_current_diagnostic_string() } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl,                  strings = { search, location } },
          })
        end,
      },
    },
  },
}
