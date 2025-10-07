vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ruler = true
vim.o.smartindent = false

vim.o.showmode = false

vim.o.list = true

vim.o.termguicolors = true

vim.wo.colorcolumn = "120"
vim.wo.signcolumn = "yes:1"

vim.o.swapfile = false
vim.o.undofile = true

vim.o.cmdheight = 1
vim.o.cursorline =  false
vim.o.laststatus = 3

vim.o.wildmode = "list:longest,full"

vim.o.errorbells = false
vim.o.number = true
vim.o.wrap = false

-- EditorConfig
vim.g.editorconfig = true
vim.b.editorconfig = true

-- Show the EOL character, so it is easier to spot trailing whitespace.
vim.opt.listchars:append("eol:↴")

-- vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("gruvbox")

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Expand %% in commands into the current directory, relative to
-- where it was opened.
-- https://www.reddit.com/r/neovim/comments/q2s3t1/comment/hfngk9b/
vim.keymap.set('c', '%%', function()
  local current_file_dir = vim.fn.expand('%:p:~:.:h')
  if current_file_dir ~= '' and current_file_dir ~= '.' then
    return current_file_dir .. '/'
  end

  -- Fallback to relative path (just ./)
  return ''
end, { expr = true })

vim.filetype.add({ extension = { njk = "jinja" }})
