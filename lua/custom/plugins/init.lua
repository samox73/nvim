vim.keymap.set('n', '<Leader>n', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<Leader>m', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<Leader>t', '<cmd>tabnew %:h<cr>')
vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

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

vim.opt.tabstop = 2
