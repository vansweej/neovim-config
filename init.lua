local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer"

if fn.isdirectory(install_path) ~= 0 then 
  vim.cmd [[packadd nvim-treesitter]]
end

require("plugins").setup()
