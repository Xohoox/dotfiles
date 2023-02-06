local map = vim.api.nvim_set_keymap
require("nvim-tree").setup()

-- todo with l,h dir open / close

map('n', '<A-f>', ':NvimTreeToggle<CR>', { noremap = true , silent = true })
