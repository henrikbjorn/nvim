-- Clipboard
vim.keymap.set('v', '<leader>y', '"*y', { noremap = true })

-- Split Mappings
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- Disable Arrow Keys
vim.api.nvim_set_keymap('', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<right>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<right>', '<nop>', {})

-- Diagnostics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
