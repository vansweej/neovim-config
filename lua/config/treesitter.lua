local rainbow = require 'ts-rainbow'

require("nvim-treesitter").setup({  

  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = { "julia", "haskell", "c", "cpp", "cmake", "cuda", "dockerfile", "glsl", "go", "html", " java", "javascript", "json", "json5", "latex", "llvm", "lua", "python", "rust", "toml", "typescript", "vim", "yaml", "bash", "nix" },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },

    rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      -- disable = { 'jsx', 'cpp' },
      -- Which query to use for finding delimiters
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = rainbow.strategy.global,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    indent = { enable = true, disable = { "python", "java" } },

    -- vim-matchup
    matchup = {
      enable = true,
    },

    -- nvim-treesitter-textsubjects
    textsubjects = {
      enable = true,
      prev_selection = ",", -- (Optional) keymap to select the previous selection
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = "textsubjects-container-inner",
      },
    },

    -- nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },

      swap = {
        enable = true,
        swap_next = {
          ["<leader>cx"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>cX"] = "@parameter.inner",
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },

      -- lsp_interop = {
      --   enable = true,
      --   border = "none",
      --   peek_definition_code = {
      --     ["<leader>cf"] = "@function.outer",
      --     ["<leader>cF"] = "@class.outer",
      --   },
      -- },
    },

    -- endwise
    endwise = {
      enable = true,
    },

    -- autotag
    autotag = {
      enable = true,
    },

    require('ts_context_commentstring').setup {
      enable_autocmd = false,
    }

    -- context_commentstring
    -- context_commentstring = {
    --  enable = true,
    --  enable_autocmd = false,
    --},

    -- indent
    -- yati = { enable = true },
  }
})
