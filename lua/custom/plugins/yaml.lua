return {
  {
    'cuducos/yaml.nvim',
    ft = { 'yaml' }, -- optional
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = function()
      require('lualine').setup {
        sections = {
          lualine_x = { require('yaml_nvim').get_yaml_key },
          vim.keymap.set('n', 'sy', '<CMD>YAMLTelescope<CR>', { desc = 'Search YAML' }),
        },
      }
    end,
  },
}
