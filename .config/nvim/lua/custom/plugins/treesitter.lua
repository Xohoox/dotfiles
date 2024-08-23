return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"html",
					"lua",
					"markdown_inline",
					"markdown",
					"vim",
					"vimdoc",
					"java",
					"xml",
					"rust",
					"javascript",
					"hyprlang",
				},
				-- Autoinstall languages that are not installed
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					-- custom_captures = {
					-- 	["javascript"] = "javascript",
					-- },
				},
				indent = { enable = true },
				-- autotag = { enable = true },
			})

			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})

			-- TODO:
			--    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
	"nvim-treesitter/playground",
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup({
	-- 			opts = {
	-- 				-- Defaults
	-- 				enable_close = true, -- Auto close tags
	-- 				enable_rename = true, -- Auto rename pairs of tags
	-- 				enable_close_on_slash = false, -- Auto close on trailing </
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
