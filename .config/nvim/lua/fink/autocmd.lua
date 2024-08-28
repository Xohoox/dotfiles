-- remove white space at end of line and file
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- autocmd InsertEnter * norm zz

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- automatic source init.sh for Projects
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Source init.sh when opening a terminal",
	group = vim.api.nvim_create_augroup("fink-term-source", { clear = true }),
	callback = function()
		if not os.getenv("PROJECT_DEV_DIR") then
			return
		end

		local source_cmd = "source " .. os.getenv("PROJECT_DEV_DIR") .. "/init.sh"
		vim.api.nvim_chan_send(vim.b.terminal_job_id, source_cmd .. "\n")
		vim.api.nvim_chan_send(vim.b.terminal_job_id, "clear\n")
	end,
})
