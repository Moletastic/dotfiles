return {
  {
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
  {
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo-comments").setup()
		end,
	}
}
