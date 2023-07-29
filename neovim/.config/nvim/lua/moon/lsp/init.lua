local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "moon.lsp.mason"
require("moon.lsp.handlers").setup()
require "moon.lsp.null-ls"
