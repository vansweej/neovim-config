local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer"

if fn.isdirectory(install_path) ~= 0 then 
   vim.cmd [[packadd nvim-treesitter]]
end

vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.hs lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.jl lua vim.lsp.buf.format()]]

require("plugins").setup()
