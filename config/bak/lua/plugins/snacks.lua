return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			image = {},
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "keys", indent = 2, padding = 1 },
					--{
					--	icon = " ",
					--	title = "Git Status",
					--	section = "terminal",
					--	enabled = function()
					--		return Snacks.git.get_root() ~= nil
					--	end,
					--	cmd = "git status --short --branch --renames",
					--	height = 5,
					--	padding = 1,
					--	ttl = 5 * 60,
					--	indent = 2,
					--},
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{ section = "startup" },
				},
			},
			explorer = { enabled = true },
			indent = { enabled = true },
			picker = { enabled = true },
			animate = { enabled = true },
			git = { enabled = true },
			gitbrowse = { enabled = true },
			lazygit = { enabled = true },
			scratch = { enabled = true },
			scroll = { enabled = true },
			terminal = { enabled = true },
			dim = { enabled = true },
		},
		keys = {
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>gb",
				function()
					Snacks.git.blame_line()
				end,
				desc = "Git blame line",
			},
			{
				"<leader>go",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Open in GitHub",
			},
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Git UI",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "Toggle terminal",
			},
			{
				"<leader>de",
				function()
					Snacks.dim.enable()
				end,
				desc = "Dim enable",
			},
			{
				"<leader>dd",
				function()
					Snacks.dim.disable()
				end,
				desc = "Dim disable",
			},
			{
				"ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent Files",
			},
		},
	},
}
