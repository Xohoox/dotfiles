-- remove white space at end of line and file
vim.api.nvim_create_augroup("whiteSpace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "whiteSpace",
    pattern = { "*" },
    command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = "whiteSpace",
    pattern = { "*" },
    command = "%s/\\n\\+\\%$//e",
})

vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

vim.cmd('augroup ths_ft au! autocmd BufNewFile,BufRead *.ths set filetype=javascript')

-- vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
--     group = "ths_ft",
--     pattern = { "*.ths" },
--     command = "set filetype=javascript",
-- })

-- augroup numbertoggle
-- 	autocmd!
-- 	autocmd BufWritePre * %s/\s\+$//e
-- 	autocmd BufWritePre * %s/\n\+\%$//e
-- augroup END


-- autocmd InsertEnter * norm zz
