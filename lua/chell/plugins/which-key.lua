return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    -- Document existing key chains
    require("which-key").register({
      ["<leader>f"] = { name = "Find", _ = "which_key_ignore" },
      ["<leader>T"] = { name = "Toggle options", _ = "which_key_ignore" },
      ["<leader>t"] = { name = "ToggleTerm", _ = "which_key_ignore" },
      ["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
      ["<leader>l"] = { name = "LSP", _ = "which_key_ignore" },
      ["<leader><tab>"] = { name = "Tab pages", _ = "which_key_ignore" },
      ["<leader>W"] = { name = "Swap windows", _ = "which_key_ignore" },
    })
    -- visual mode
    require("which-key").register({
      ["<leader>h"] = { "Git [H]unk" },
    }, { mode = "v" })
  end,
}
