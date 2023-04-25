local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
		profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
    use {
      "haishanh/night-owl.vim",
      config = function()
        vim.cmd "colorscheme night-owl"
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

		-- Documentation
		use { "nanotee/luv-vimdocs", event = "BufReadPre" }
    use { "milisims/nvim-luaref", event = "BufReadPre" }

    -- Git
    use {
      "TimUntersberger/neogit",
			cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

		-- gitsigns
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      wants = "plenary.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.gitsigns")
      end,
    }

    -- WhichKey
    use {
      "folke/which-key.nvim",
			event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }
       
    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Nerdtree for neovim
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = function()
        require("config.ntree")
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }

    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      config = function()
        require("config.statusline") 
      end,
      requires = { "nvim-web-devicons" },
    }

    use {
      "nvim-telescope/telescope.nvim",
      opt = true,
      config = function()
        require("config.telescope")
      end,
      cmd = { "Telescope" },
      module = { "telescope", "telescope.builtin" },
--      keys = { "<leader>f", "<leader>p", "<leader>z" },
      wants = {
        "plenary.nvim",
        "telescope-fzf-native.nvim",
      },
      requires = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      }
    }

-- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufReadPre",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
        { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
        { "HiPhish/nvim-ts-rainbow2", event = "BufReadPre" },
        { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
        -- { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
        -- { "yioneko/nvim-yati", event = "BufReadPre" },
      },
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      event = "BufReadPre",
      config = function()
        require("config.lspconf")
      end,
      requires = {
        "onsails/lspkind-nvim",
      },
    }

    use {
			"junnplus/lsp-setup.nvim",
			event = "BufReadPre",
      requires = {
				{ "neovim/nvim-lspconfig"},
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
      },
      config = function()
        require("config.lsp-setup")
      end,
    }

    -- Autocompletion
    use {
			"hrsh7th/nvim-cmp",
--  		event = "BufReadPre",
			requires = {
				{ "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
      },
		}

--    use {
--			"windwp/nvim-autopairs",
--			event = "BufReadPre",
--			config = function()
--				require("nvim-autopairs").setup {}
--			end,
--		}

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
