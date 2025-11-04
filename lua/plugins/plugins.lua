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

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
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


  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach", -- lazy load on LSP attach
    keys = function()
      local opts = { silent = true, noremap = true }

      return {
        -- Diagnostics
        { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts },
        { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts },
        { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts },
        { "<leader>ce", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts },
        -- Code actions
        { "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts },
        -- Breadcrumb toggle (toggle winbar)
        { "<leader>tb", "<cmd>Lspsaga winbar_toggle<CR>", opts },
      }
    end,
    opts = {
      ui = {
        border = "rounded",
        title = true,
        code_action = "💡", -- icon for available actions
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = true, -- <-- breadcrumbs
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 1,
        color_mode = true,
      },
      diagnostic = {
        show_code_action = true,
        jump_num_shortcut = true,
        show_source = true,
        max_width = 0.7,
        max_height = 0.6,
        keys = {
          exec_action = "o",
          quit = "q",
          toggle_or_jump = "<CR>",
        },
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
    },
  },
}
