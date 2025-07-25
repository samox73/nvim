return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup {
        element_mappings = {
          stacks = {
            open = '<CR>',
            expand = 'o',
          },
        },
      }
      local dap, dapui = require 'dap', require 'dapui'
      vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = '[D]apUI [T]oggle' })
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Dap continue' })
      vim.keymap.set('n', '<F6>', dap.terminate, { desc = 'Dap terminate' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Dap step over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Dap step into' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Dap step out' })
      vim.keymap.set('n', '<Leader>b', function() require('persistent-breakpoints.api').toggle_breakpoint() end, { desc = '[B]reakpoint toggle' })
      vim.keymap.set('n', '<Leader>do', dap.repl.open, { desc = '[D]ap REPL [O]pen' })
      vim.keymap.set('n', '<Leader>du', dap.up, { desc = '[D]ap stack [U]p' })
      vim.keymap.set('n', '<Leader>dd', dap.down, { desc = '[D]ap stack [D]own' })
      vim.fn.sign_define('DapBreakpoint', { text = '⏺', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '➡', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
    end,
  },
  {
    'leoluz/nvim-dap-go',
    config = function()
      local dapgo = require 'dap-go'
      vim.keymap.set('n', '<F7>', function() dapgo.debug_test() end)
      vim.keymap.set('n', '<F8>', function() dapgo.debug_last_test() end)
      dapgo.setup()
    end,
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
