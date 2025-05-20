local dap = require('dap')
require('dap').adapters["node2"] = {
  type = 'executable',
  command = 'node',
  args = { '/usr/lib/vscode-node-debug2/out/src/nodeDebug.js' }
}
dap.configurations.typescript = {
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
    port = 9230,
    protocol = 'inspector',
    console = 'integratedTerminal',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    skipFiles = {
      "<node_internals>/**"
    }
  },
}

dap.configurations.javascript = {
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
    processId = require 'dap.utils'.pick_process,
  },
}

dap.configurations.php = {
  {
    name = 'Listen for XDebug',
    type = 'php',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    log = true,
    hostname = '0.0.0.0'
  },
}

require('mason-nvim-dap').setup {
  -- Makes a best effort to setup the various debuggers with
  -- reasonable debug configurations
  automatic_setup = true,

  -- You can provide additional configuration to the handlers,
  -- see mason-nvim-dap README for more information
  handlers = {
    function(config)
      require('mason-nvim-dap').default_setup(config)
    end,
    php = function(config)
      config.configurations = {
        {
          type = 'php',
          request = 'launch',
          name = "Listen for XDebug",
          port = 9000,
          log = true,
          pathMappings = {
            ['/var/www/html/'] = vim.fn.getcwd() .. '/',
          },
          hostname = '0.0.0.0',
        }
      }

      require('mason-nvim-dap').default_setup(config)     -- don't forget this!
    end,

  },

  -- You'll need to check that you have the required things installed
  -- online, please don't ask me how to install them :)
  ensure_installed = {
    -- Update this to ensure that you have the debuggers for the langs you want
    'delve',
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
