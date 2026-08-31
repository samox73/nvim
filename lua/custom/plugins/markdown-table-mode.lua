-- Formats Markdown tables automatically while they are edited.
return {
  {
    'Kicamon/markdown-table-mode.nvim',
    config = function() require('markdown-table-mode').setup() end,
  },
}
