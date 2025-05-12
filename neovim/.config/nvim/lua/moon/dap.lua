require('dap').adapters["node2"] = {
  type = 'executable',
  command = 'node',
  args = { '/usr/lib/vscode-node-debug2/out/src/nodeDebug.js' }
}

require('dap').configurations.typescript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Use json config',
    type = 'node2',
    request = 'attach',
  },
}

require('dap').configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
-- require("dapui").setup()
-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
-- keymap("n", "<leader>dwc", "<Esc>:DapContinue<CR>", opts)
-- keymap("n", "<leader>dwd", "<Esc>:DapToggleBreakpoint<CR>", opts)
-- keymap("n", "<leader>dwq", "<Esc>:DapStepOver<CR>", opts)
-- keymap("n", "<leader>dww", "<Esc>:DapStepInto<CR>", opts)
-- keymap("n", "<leader>dwe", "<Esc>:DapStepOut<CR>", opts)
-- keymap("n", "<leader>dwt", "<Esc>:DapToggleRepl<CR>", opts)
-- keymap("n", "<leader>dwx", "<Esc>:DapTerminate<CR>", opts)
