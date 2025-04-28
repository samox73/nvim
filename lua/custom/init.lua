vim.keymap.set('n', '<Leader>n', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<Leader>m', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<Leader>t', '<cmd>tabnew %:h<cr>')
vim.keymap.set('n', 'gt', '<cmd>tab split | lua vim.lsp.buf.definition()<cr>', {})

vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.diagnostic.config { virtual_text = true }
