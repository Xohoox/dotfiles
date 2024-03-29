-- remove white space at end of line and file
--vim.api.nvim_create_augroup("whiteSpace", { clear = true })
--vim.api.nvim_create_autocmd("BufWritePre", {
--    group = "whiteSpace",
--    pattern = { "*" },
--    command = "%s/\\s\\+$//e",
--})
--
--vim.api.nvim_create_autocmd("BufWritePre", {
--    group = "whiteSpace",
--    pattern = { "*" },
--    command = "%s/\\n\\+\\%$//e",
--})

vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- autocmd InsertEnter * norm zz

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	desc = "ths java highlight",
	pattern = "*.ths",
	group = vim.api.nvim_create_augroup("ths_js", { clear = true }),
	callback = function()
		vim.bo.filetype = "javascript"
	end,
})
