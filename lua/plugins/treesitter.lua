return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",           -- ← very important in 2026
    lazy = false,              -- usually needed for treesitter
    build = ":TSUpdate",
    -- New main-branch style setup (NO require("nvim-treesitter.configs"))
    config = function()
      local ts = require("nvim-treesitter")

      -- Install wanted parsers (do NOT use ensure_installed anymore)
      ts.install({
        "lua", "vim", "vimdoc", "query",
        "python", "javascript", "typescript", "tsx", "html", "css", -- add yours
        -- ...
      })

      -- Optional: auto-enable on every buffer (recommended workaround)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",           -- ← must match!
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            -- add more you like...
          },
        },
        -- move = { enable = true, ... }, etc.
      })
    end,
  },
}
