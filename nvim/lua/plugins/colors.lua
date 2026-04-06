return {
  {
    "ianwalter/brooks.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "brooks"

      vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#0E1A1A" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    },
  },
}
