local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
    -- JS/TS
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    code_actions.eslint,
    formatting.eslint,
    diagnostics.eslint,
    -- Python
		formatting.black.with({ extra_args = { "--fast" } }),
    diagnostics.flake8,
    -- Lua
		formatting.stylua,
    -- Elixir
    formatting.mix,
    diagnostics.credo,
    -- Golang
    diagnostics.golangci_lint,
    code_actions.gomodifytags,
    -- Rust
    formatting.rustfmt,
    -- Misc
    diagnostics.hadolint,
    diagnostics.shellcheck,
    diagnostics.terraform_validate,
	},
})
