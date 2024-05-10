return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
    require("nvim-surround").setup({
      surrounds = {
        --TODO: implement delete and change. More generally, add filetype-dependent surrounds for raw strings
        ["R"] = {
          add = function()
            local barrier = require("nvim-surround.config").get_input("Barrier: ")
            return { { 'R"' .. barrier .. "(" }, { ")" .. barrier .. '"' } }
          end,
        },
      },
    })
  end,
}
