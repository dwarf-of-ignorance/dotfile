vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
  opts = {
    -- Open Yazi when directories are opened
    open_for_directories = true,  -- Hijack Netrw and open Yazi
    open_multiple_tabs = false,  -- Optional: Disable opening multiple tabs
    floating_window_scaling_factor = 0.9,  -- Adjust window scaling if needed
    yazi_floating_window_border = "rounded",  -- Set border style
    clipboard_register = "*",  -- Use system clipboard for copying
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "<c-v>",
      open_file_in_horizontal_split = "<c-x>",
      open_file_in_tab = "<c-t>",
      grep_in_directory = "<c-s>",
      replace_in_directory = "<c-g>",
      cycle_open_buffers = "<tab>",
      copy_relative_path_to_selected_files = "<c-y>",
      send_to_quickfix_list = "<c-q>",
      change_working_directory = "<c-\\>",
    },
  },
})
