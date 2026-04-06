return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      local conf = require("telescope.config").values
      local opts = require("telescope.themes").get_ivy({ prompt_title = "Harpoon" })

      require("telescope.pickers").new(opts, {
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),
      }):find()
    end

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Anclar archivo" })
    vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end, { desc = "Desanclar archivo actual" })
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>fl", function() toggle_telescope(harpoon:list()) end)
    vim.keymap.set("n", "<M-u>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<M-i>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<M-o>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<M-p>", function() harpoon:list():select(4) end)
  end,
}
