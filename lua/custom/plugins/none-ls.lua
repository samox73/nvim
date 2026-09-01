-- Exposes external linters and formatters through Neovim's LSP interface.
return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local none = require 'null-ls'
      local parent = vim.fn.readfile('/proc/' .. vim.uv.os_getppid() .. '/comm')[1]
      local markdownlint_args = (parent:find 'codex' or parent:find 'claude') and { '--disable', 'MD013', 'MD047' } or { '--disable', 'MD013' }
      none.setup {
        sources = {
          none.builtins.diagnostics.markdownlint.with { extra_args = markdownlint_args },
          none.builtins.formatting.stylua,
          none.builtins.formatting.sql_formatter.with { command = { 'sleek' } },
        },
      }
    end,
  },
}
