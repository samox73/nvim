-- Adds LaTeX editing, compilation, and PDF viewing through VimTeX.
return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_syntax_enabled = 0
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_quickfix_open_on_warning = 0

      -- One sioyek instance (= one window) per PDF. sioyek 2.0's `--new-window` is supposed to reuse
      -- a window already showing the file but always opens a new one, so key an instance on the PDF path.
      -- VimTeX reads this global at view time, so refresh it whenever a TeX buffer becomes current.
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.tex",
        callback = function()
          if vim.b.vimtex then
            local id = vim.fn.sha256(vim.b.vimtex.root .. "/" .. vim.b.vimtex.name):sub(1, 12)
            vim.g.vimtex_view_sioyek_options = "--instance-name vimtex_" .. id
          end
        end,
      })

      -- Start continuous compilation (latexmk -pvc) for every LaTeX project as soon as it's opened.
      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventInitPost",
        callback = function() vim.cmd("VimtexCompile") end,
      })
    end
  }
}
