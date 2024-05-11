return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
    -- stylua: ignore start
      -- { '<Leader>ua', 'ga', desc = 'Show character under cursor' },
      { '<leader>a', function() require('harpoon'):list():add() end, desc = 'Add Harpoon location' },
      { 'L', function() require('harpoon'):list():next() end, desc = 'Next Harpoon location' },
      { 'H', function() require('harpoon'):list():prev() end, desc = 'Previous Harpoon location' },
      { '<leader>A', function() require('harpoon'):list():remove() end, desc = 'Remove Harpoon location' },
      { '<localleader>1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon select 1' },
      { '<localleader>2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon select 2' },
      { '<localleader>3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon select 3' },
      { '<localleader>4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon select 4' },
      { '<localleader>5', function() require('harpoon'):list():select(5) end, desc = 'Harpoon select 5' },
      -- stylua: ignore end
      {
        "<leader><leader>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Toggle Harpoon list",
      },
    },
  },
}
