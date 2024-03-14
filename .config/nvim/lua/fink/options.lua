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

-- line numbers
opt.number = true
opt.relativenumber = true

opt.showmode = false
opt.exrc = true
opt.hidden = true
opt.showmatch = true
opt.belloff = "all"
opt.swapfile = false
opt.backup = false
opt.undodir = vim.env.XDG_DATA_HOME .. "/nvim/vimundo"
opt.undofile = true
opt.scrolloff = 10
opt.cursorline = true
opt.equalalways = false
-- opt.path += '**'
opt.showcmd = true
opt.termguicolors = true
opt.mouse = "a"
opt.completeopt = "menuone,noinsert,noselect"
-- opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- splits
opt.splitbelow = true
opt.splitright = true

-- time
opt.updatetime = 250
opt.timeoutlen = 300

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.tabstop = 4
opt.softtabstop = 4
-- opt.shiftwidth = 4

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

local function is_wsl()
	-- Check if /proc/version contains "Microsoft" indicating WSL environment
	local proc_version = io.open("/proc/version", "r")
	if proc_version then
		local version_info = proc_version:read("*all")
		proc_version:close()
		if version_info:lower():find("microsoft") then
			return true
		end
	end
	return false
end

if is_wsl() then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
