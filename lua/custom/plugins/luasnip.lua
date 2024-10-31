return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      local ls = require 'luasnip'
      local types = require 'luasnip.util.types'
      ls.config.set_config {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
      }
      vim.keymap.set({ 'i' }, '<C-K>', function() ls.expand() end)
      vim.keymap.set({ 'i', 's' }, '<Tab>', function()
        if ls.expand_or_jumpable() then ls.expand_or_jump() end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
        if ls.jumpable(-1) then ls.jump(-1) end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<F48>', function()
        if ls.choice_active() then ls.change_choice(1) end
      end, { silent = true })
      vim.keymap.set('n', '<leader>rs', '<cmd>tabnew ~/.config/nvim/lua/custom/snippets/init.lua<cr>')
      vim.keymap.set('n', '<leader>rr', "lua require 'custom.snippets.lua'")
      require 'custom.snippets'
    end,
  },
}
