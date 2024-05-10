return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    local nmap = require("chell.utils").nmap
    local Terminal = require("toggleterm.terminal").Terminal
    local on_open = function(term)
      vim.cmd("startinsert!")
      -- vim.keymap.set("n", "q", "<cmd>close<CR>", { noremap = true, silent = true, buffer = term.bufnr })
    end
    local on_close = function(term)
      vim.cmd("startinsert!")
    end
    if vim.fn.executable("lazygit") then
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        on_open = on_open,
        on_close = on_close,
      })
      nmap("<leader>gg", function()
        lazygit:toggle()
      end, { desc = "ToggleTerm LazyGit" })
    end

    nmap("<leader>tf", function()
      Terminal:new({ count = vim.v.count1, on_open = on_open, on_close = on_close }):toggle(nil, "float")
    end)
    nmap("<leader>tv", function()
      Terminal:new({ count = vim.v.count1, on_open = on_open, on_close = on_close }):toggle(nil, "vertical")
    end)
    nmap("<leader>th", function()
      Terminal:new({ count = vim.v.count1, on_open = on_open, on_close = on_close }):toggle(nil, "horizontal")
    end)
  end,
}
