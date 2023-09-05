require('neorg').setup({
  load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
              workspaces = {
                  main = "~/notes/main",
                  jooycar = "~/notes/jooycar",
              },
          },
      },
      ["core.integrations.telescope"] = {}
  },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>ww", "<Esc>:Neorg workspace ", opts)
keymap("n", "<leader>wn", "<Esc>:Neorg keybind norg core.dirman.new.note<CR>", opts)
keymap("n", "<leader>wl", "<Esc>:Telescope neorg insert_link<CR>", opts)
keymap("n", "<leader>wj", "<Esc>:Neorg journal ", opts)
