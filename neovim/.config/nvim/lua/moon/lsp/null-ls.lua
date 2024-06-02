local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

local eslint_d = helpers.make_builtin({
   name = "eslint_d",
    meta = {
        url = "https://github.com/mantoni/eslint_d.js/",
        description = "Like ESLint, but faster.",
        notes = {
            "Once spawned, the server will continue to run in the background. This is normal and not related to null-ls. You can stop it by running `eslint_d stop` from the command line.",
        },
    },
    method = FORMATTING,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    generator_opts = {
        command = "eslint_d",
        args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
        to_stdin = true,
    },
    factory = helpers.formatter_factory, 
})

null_ls.setup({
	debug = false,
	sources = {
    -- JS/TS
		--formatting.prettier,
    eslint_d,
    				require("null-ls.code_actions.eslint_d"),

				require("null-ls.diagnostics.eslint_d"),
    -- formatting.eslint_d,
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
