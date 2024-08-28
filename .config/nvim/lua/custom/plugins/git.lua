return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		keys = {
			{
				"<leader>wc",
				function()
					require("telescope").load_extension("git_worktree")
					require("telescope").extensions.git_worktree.create_git_worktree()
				end,
			},
			{
				"<leader>wt",
				function()
					require("telescope").load_extension("git_worktree")
					require("telescope").extensions.git_worktree.git_worktrees()
				end,
			},
		},
		config = function()
			local Worktree = require("git-worktree")

			Worktree.on_tree_change(function(op, metadata)
				if op == Worktree.Operations.Switch then
					print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
					if os.getenv("HOOK_SWITCH_WORKTREE_SCRIPT") then
						os.execute(
							os.getenv("HOOK_SWITCH_WORKTREE_SCRIPT")
								.. " "
								.. metadata.prev_path
								.. " "
								.. metadata.path
						)
					end
				end
			end)
		end,
	},
	{ "tpope/vim-fugitive" },
}
