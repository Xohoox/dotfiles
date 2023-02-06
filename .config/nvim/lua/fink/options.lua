vim.g.loaded_matchparen = 1

local opt = vim.opt

-- ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.wildmode = { "longest", "list", "full" }

-- floating window popup menu for completion on command line
-- opt.pumblend = 17
-- opt.wildmode = opt.wildmode - "list"
-- opt.wildmode = opt.wildmode + { "longest", "full" }
-- opt.pumblend = 17
opt.wildoptions = "pum"

-- opt.showmode = false -- vielleicht, wenn lua bar da ist
opt.number = true
opt.exrc = true
opt.number = true
opt.relativenumber = true
opt.incsearch = true
opt.hidden = true
opt.showmatch = true
opt.belloff = "all"
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.env.XDG_DATA_HOME .. '/nvim/vimundo'
opt.undofile = true
opt.scrolloff = 10
opt.cursorline = true
opt.equalalways = false
opt.updatetime = 1000
-- opt.path += '**'
opt.showcmd = true
opt.termguicolors = true
opt.mouse = 'nvi'
-- opt.wildmode=longest,list,full
opt.splitbelow = true
opt.completeopt = 'menuone,noinsert,noselect'

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.joinspaces = false

-- opt.formatoptions = opt.formatoptions
--   - "a" -- Auto formatting is BAD.
--   - "t" -- Don't auto format my code. I got linters for that.
--   + "c" -- In general, I like it when comments respect textwidth
--   + "q" -- Allow formatting comments w/ gq
--   - "o" -- O and o, don't continue comments
--   + "r" -- But do continue when pressing enter.
--   + "n" -- Indent past the formatlistpat, not underneath it.
--   + "j" -- Auto-remove comments if possible.
--   - "2" -- I'm not in gradeschool anymore
