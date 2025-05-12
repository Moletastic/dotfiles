return {
  "akinsho/bufferline.nvim",
 --  {
	-- 	"stevearc/aerial.nvim",
	-- 	config = function()
	-- 		require("aerial").setup({
	-- 			on_attach = function(bufnr)
	-- 				-- Jump forwards/backwards with '{' and '}'
	-- 				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
	-- 				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	-- 			end,
	-- 		})
	-- 	end,
	-- },
  {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	},
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  "moll/vim-bbye"
}
