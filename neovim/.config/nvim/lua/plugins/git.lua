return {
	"lewis6991/gitsigns.nvim",
	-- "f-person/git-blame.nvim",
	{
		"tanvirtin/vgit.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		-- Lazy loading on 'VimEnter' event is necessary.
		event = "VimEnter",
		config = function()
			require("vgit").setup({
				settings = {
					live_blame = {
						enabled = true,
						format = function(blame, git_config)
							local author = blame.author
							local time = os.difftime(os.time(), blame.author_time) / (60 * 60 * 24 * 30 * 12)
							local time_divisions = {
								{ 1, "years" },
								{ 12, "months" },
								{ 30, "days" },
								{ 24, "hours" },
								{ 60, "minutes" },
								{ 60, "seconds" },
							}
							local counter = 1
							local time_division = time_divisions[counter]
							local time_boundary = time_division[1]
							local time_postfix = time_division[2]
							while time < 1 and counter ~= #time_divisions do
								time_division = time_divisions[counter]
								time_boundary = time_division[1]
								time_postfix = time_division[2]
								time = time * time_boundary
								counter = counter + 1
							end
							local commit_message = blame.commit_message
							if not blame.committed then
								commit_message = "uncommited"
								return string.format("[%s]: %s", author, commit_message)
							end
							local max_commit_message_length = 255
							if #commit_message > max_commit_message_length then
								commit_message = commit_message:sub(1, max_commit_message_length) .. "..."
							end
							return string.format(
								"[%s][%s] %s",
								author,
								string.format(
									"%s %s ago",
									time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
									time_postfix
								),
								commit_message
							)
						end,
					},
				},
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
			"folke/snacks.nvim", -- optional
		},
	},
}
