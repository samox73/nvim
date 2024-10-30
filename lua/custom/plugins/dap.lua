return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup()
      vim.keymap.set('n', '<leader>d', function() require('dapui').toggle() end, { desc = '[S]earch [H]elp' })
      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F6>', function() require('dap').terminate() end)
      vim.keymap.set('n', '<Leader>u', function() require('dap').up() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>b', function() require('persistent-breakpoints.api').toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>o', function() require('dap').repl.open() end)
      vim.fn.sign_define('DapBreakpoint', { text = '⏺', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '➡', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
    end,
  },
  {
    'leoluz/nvim-dap-go',
    config = function() require('dap-go').setup() end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function() require('nvim-dap-virtual-text').setup() end,
  },
  {
    'Weissle/persistent-breakpoints.nvim',
    config = function()
      require('persistent-breakpoints').setup {
        load_breakpoints_event = { 'BufReadPost' },
      }
    end,
  },
}
