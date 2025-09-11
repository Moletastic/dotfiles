local ok, _ = pcall(require, "bookmarks.commands")

if not ok then return end

local map = vim.keymap.set

map("n", "mm", ":BookmarksMark<CR>", {})
map("n", "mn", ":BookmarksGotoNext<CR>", {})
map("n", "mp", ":BookmarksGotoPrev<CR>", {})
map("n", "ml", ":BookmarksGoto<CR>", {})
map("n", "mo", ":BookmarksTree<CR>", {})
map("n", "<leader>f", "<cmd>:Format<cr>", {})
