return {
  "gbprod/substitute.nvim",
  config = function()
    require("substitute").setup({})

    local nmap = require("chell.utils").nmap
    local xmap = require("chell.utils").xmap

    nmap("x", require("substitute").operator, { noremap = true })
    nmap("xx", require("substitute").line, { noremap = true })
    nmap("X", require("substitute").eol, { noremap = true })
    xmap("x", require("substitute").visual, { noremap = true })
  end,
}
