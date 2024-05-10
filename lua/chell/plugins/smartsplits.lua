return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    local nmap = require("chell.utils").nmap
    local plug = require("smart-splits")
    --- resize
    nmap("<A-h>", plug.resize_left, { desc = "Resize window to left" })
    nmap("<A-j>", plug.resize_down, { desc = "Resize window to down" })
    nmap("<A-k>", plug.resize_up, { desc = "Resize window to up" })
    nmap("<A-l>", plug.resize_right, { desc = "Resize window to right" })
    --- navigate
    nmap("<C-h>", plug.move_cursor_left, { desc = "Move to left window" })
    nmap("<C-j>", plug.move_cursor_down, { desc = "Move to down window" })
    nmap("<C-k>", plug.move_cursor_up, { desc = "Move to up window" })
    nmap("<C-l>", plug.move_cursor_right, { desc = "Move to right window" })
    nmap("<C-\\>", plug.move_cursor_previous, { desc = "Move to previous window" })
    --- swap
    nmap("<leader>Wh", plug.swap_buf_left, { desc = "Swap with left buffer" })
    nmap("<leader>Wj", plug.swap_buf_down, { desc = "Swap with right buffer" })
    nmap("<leader>Wk", plug.swap_buf_up, { desc = "Swap with upper buffer" })
    nmap("<leader>Wl", plug.swap_buf_right, { desc = "Swap with bottom buffer" })
  end,
}
