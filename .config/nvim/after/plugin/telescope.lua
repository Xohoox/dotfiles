local Remap = require("fink.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>f", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>p", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>b", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader><F1>", function()
    require('telescope.builtin').builtin()
end)

nnoremap("[t", function()
    require('telescope.builtin').diagnostics()
end)

nnoremap("<leader>gb", function()
    require('telescope.builtin').git_branches()
end)

nnoremap("<leader>gc", function()
    require('telescope.builtin').git_commits()
end)
