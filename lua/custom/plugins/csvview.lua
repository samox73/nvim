-- Displays CSV files as readable, aligned tables.
return {
  {
    'hat0uma/csvview.nvim',
    config = function() require('csvview').setup() end,
  },
}
