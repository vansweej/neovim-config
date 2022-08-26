local M = {}

function M.setup()
  local g = vim.g
  g.sort_by = "case_sensitive"
  g.view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  }
  g.renderer = {
    group_empty = true,
  }
  g.filters = {
    dotfiles = true,
  }
end

return M
