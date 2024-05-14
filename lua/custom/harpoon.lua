local harpoon = require "harpoon"
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader><leader>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<c-n>", function()
  require("harpoon"):list():next()
end)

vim.keymap.set("n", "<c-p>", function()
  require("harpoon"):list():prev()
end)

-- Set <space>1..<space>5 be my shortcuts to moving to the files
for _, idx in ipairs { 1, 2, 3, 4, 5 } do
  vim.keymap.set("n", string.format("<leader>%d", idx), function()
    harpoon:list():select(idx)
  end)
end
