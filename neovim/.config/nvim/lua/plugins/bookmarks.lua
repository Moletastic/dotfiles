return {
	-- {
	--   "tomasky/bookmarks.nvim",
	--   config = function ()
	--     require('bookmarks').setup()
	--   end
	-- }
	"LintaoAmons/bookmarks.nvim",
	-- pin the plugin at specific version for stability
	-- backup your bookmark sqlite db when there are breaking changes
	tag = "v2.3.0",
	dependencies = {
		{ "kkharji/sqlite.lua" },
		{ "nvim-telescope/telescope.nvim" }, -- currently has only telescopes supported, but PRs for other pickers are welcome
		{ "stevearc/dressing.nvim" }, -- optional: better UI
		{ "GeorgesAlkhouri/nvim-aider" }, -- optional: for Aider integration
	},
	opts = {
		signs = {
			-- Sign mark icon and color in the gutter
			mark = {
				icon = "󰃁",
				color = "#21adad",
				line_bg = "#115c5c",
			},
			desc_format = function(bookmark)
				---@cast bookmark Bookmarks.Node
				return bookmark.order .. ": " .. bookmark.name
			end,
		},
	},
}
