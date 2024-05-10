return {
  "ggandor/leap.nvim",
  lazy = false,
  opts = {
    safe_labels = {},
  },
  config = function(_, opts)
    local nmap = require("chell.utils").nmap
    nmap("s", "<Plug>(leap)", { desc = "Leap" })
    nmap("S", "<Plug>(leap-from-window)", { desc = "Leap other window" })
    require("leap").setup(opts)
  end,
}
