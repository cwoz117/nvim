-- ~/.config/nvim/lua/plugins/init.lua
return {
  { "folke/lazy.nvim" },

  { "nvim-tree/nvim-tree.lua", opts = { view = { width = 50, signcolumn = "yes"}}},

  { "mason-org/mason.nvim", opts = {}, },

  { "mason-org/mason-lspconfig.nvim",
    dependencies = {"neovim/nvim-lspconfig",},
    opts = {},
  },

  { "navarasu/onedark.nvim",
    opts   = { style = 'darker' },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end
  },

  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim",},
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    },
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        prompt_prefix = " 🔍 ",
        selection_caret = "> ",
        file_ignore_patterns = { "node_modules" },
      },
    },
  },

  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", event = { "BufReadPost", "BufNewFile" },
    opts  = {
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false,},
      indent    = { enable = true },
      ensure_installed = {
        "bash", "vim", "vimdoc", "json", "yaml", "toml", "dockerfile",
        "lua", "go", "python", "javascript", "typescript", "rust" },
    },
  },
}

