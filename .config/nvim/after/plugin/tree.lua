if not pcall(require, "nvim-tree") then
	return
end

require("nvim-tree").setup()

local map = vim.api.nvim_set_keymap

map("n", "<A-f>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
