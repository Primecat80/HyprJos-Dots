return {
  { -- El mejor plugin de Git
    'tpope/vim-fugitive',
  },
  { -- Árbol de historial de cambios
    'mbbill/undotree',
    config = function()
      -- Asignamos la tecla <leader>u para mostrar/ocultar los cambios
      vim.keymap.set("n", "<leader>u", vim.cmd.undotreeToggle, { desc = "Mostrar cambios (Undotree)" })
    end
  },
  { -- Resaltado de colores CSS
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
}
