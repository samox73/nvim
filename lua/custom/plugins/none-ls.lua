return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local none = require 'null-ls'
      none.setup {
        sources = {
          none.builtins.diagnostics.markdownlint,
          none.builtins.formatting.stylua,
          none.builtins.completion.spell,
        },
      }
    end,
  },
}
