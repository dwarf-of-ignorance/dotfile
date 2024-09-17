-- Set the directory for undo files
local undodir = vim.fn.expand('~/.vim/undodir')
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, 'p')
end

-- Enable persistent undo
vim.opt.undodir = undodir
vim.opt.undofile = true

