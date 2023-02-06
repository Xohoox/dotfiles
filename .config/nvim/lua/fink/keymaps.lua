local map = vim.api.nvim_set_keymap

local opt_normap = { noremap = true }
local opt_silent = { silent = true }

-- map leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '
map('n', 'Q', '<nop>', {})

-- search / replace
map('n', '<leader>r', ':%s//gI<Left><Left><Left>', {})
map('v', '<leader>r', ':s//gI<Left><Left><Left>', {})
map('n', '<leader>w', ':nohlsearch<cr>', opt_silent)  -- sinnvolle taste
map('n', 'n', 'nzzzv', opt_normap)
map('n', 'N', 'Nzzzv', opt_normap)

-- relative line movement in jump list
map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', { noremap = true, expr = true})
map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', { noremap = true, expr = true})

-- splits
map('n', '<leader>h', ':split<Space>', {})
map('n', '<leader>v', ':vsplit<Space>', {})
map('n', '<leader>+', ':vertical resize +5<cr>', opt_silent)
map('n', '<leader>-', ':vertical resize -5<cr>', opt_silent)
-- todo: :resize +5<cr> einbauen
map('n', '<C-j>', '<C-w>j', opt_normap);
map('n', '<C-h>', '<C-w>h', opt_normap);
map('n', '<C-k>', '<C-w>k', opt_normap);
map('n', '<C-l>', '<C-w>l', opt_normap);

-- copy & past
map('n', '<C-c>', '"+y', opt_normap)
map('n', '<C-p>', '"+p', opt_normap)
-- map <C-x> "+d --todo: nicht belegte taste finden
map('n', 'Y', 'y$', opt_normap)
-- map('n', 'Y', 'gg"+yG', opt_normap) -- todo: find key + jump back <c-o>

-- delete & change into blackhole buffer
map('v', '<leader>p', '"_dP', opt_normap) -- todo doppelt belegt
map('n', '<leader>d', '"_d', opt_normap)
map('n', '<leader>D', '"_D', opt_normap)
map('n', '<leader>c', '"_c', opt_normap)

-- delete word in insert mode
map('i', '<C-H>', '<C-w>', opt_normap)
map('i', '<C-Del>', '<C-o>de', opt_normap)

-- line numbers
map('n', '<C-n>', ':set invrelativenumber<cr>', opt_silent)

-- move lines up and down
map('v', 'J', ":m '>+1<cr>gv=gv", opt_normap)
map('v', 'K', ":m '<-2<cr>gv=gv", opt_normap)
map('n', '<leader>j', ':m .+1<cr>==', { noremap = true, silent = true})
map('n', '<leader>k', ':m .-2<cr>==', { noremap = true, silent = true})
map('i', '<C-j>', '<esc>:m .+1<cr>==gi', opt_normap)
map('i', '<C-k>', '<esc>:m .-2<cr>==gi', opt_normap)

-- insert mode new undo chain
map('i', ' ', ' <c-g>u', opt_normap)
map('i', ',', ',<c-g>u', opt_normap)
map('i', '.', '.<c-g>u', opt_normap)
map('i', '!', '!<c-g>u', opt_normap)
map('i', '?', '?<c-g>u', opt_normap)

-- noch sortieren
map('n', 'J', "moJ`o", opt_normap)

-- spell checking
map('n', '<leader>sd', ':setlocal spell! spelllang=de_de<cr>', {})
map('n', '<leader>se', ':setlocal spell! spelllang=en_us<cr>', {})


map('n', '<leader>y', 'gg<c-c>G<c-o>', {})

-- Switch between tabs
-- nnoremap <Right> gt
-- nnoremap <Left>  gT

-- blank line
map('n', '<leader>O', ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>", { noremap = true, silent = true })
map('n', '<leader>o', ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>", { noremap = true, silent = true })
