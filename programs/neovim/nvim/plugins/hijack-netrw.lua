-- Disable netrw first
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local yazi_ok, yazi = pcall(require, "yazi")
if not yazi_ok then
  print("yazi.nvim not found. Please ensure it's properly installed.")
  return
end

-- Set up autocmd to hijack directory opens
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*",
  callback = function(ev)
    local path = ev.file
    
    if vim.fn.isdirectory(path) == 1 then
      -- Delete the current buffer
      vim.api.nvim_buf_delete(0, { force = true })
      -- Use yazi's Lua API directly
      yazi.yazi { path = path }
      return true
    end
  end
})
