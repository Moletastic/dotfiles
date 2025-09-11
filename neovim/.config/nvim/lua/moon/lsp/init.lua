local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("moon.lsp.mason")
require("moon.lsp.handlers").setup()

require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
}
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		typescript = { "prettier" },
	},
})

vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "InsertLeave", "BufEnter" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
require("moon.lsp.null-ls")
