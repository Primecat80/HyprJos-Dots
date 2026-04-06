return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { 
        "python", 
        "bash", 
        "html", 
        "css", 
        "javascript", 
        "typescript", 
        "tsx", 
        "vue" 
      },
      highlight = {
        enable = true,
      },
      indent = { 
        enable = true 
      },
    },
    config = function(_, opts)
      local status, treesitter = pcall(require, "nvim-treesitter.configs")
      if status then
        treesitter.setup(opts)
      end
    end,
  },
}
