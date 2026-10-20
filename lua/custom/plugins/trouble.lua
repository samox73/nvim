-- Presents diagnostics, symbols, LSP results, and lists in navigable panels.
return {
  {
    'folke/trouble.nvim',
    opts = {
      modes = {
        errors = { mode = 'diagnostics', filter = { severity = vim.diagnostic.severity.ERROR } },
      },
    },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble errors toggle<cr>',
        desc = 'Errors (Trouble)',
      },
      {
        ']e',
        function() require('trouble').next { mode = 'errors', jump = true } end,
        desc = 'Next error (Trouble)',
      },
      {
        '[e',
        function() require('trouble').prev { mode = 'errors', jump = true } end,
        desc = 'Previous error (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
