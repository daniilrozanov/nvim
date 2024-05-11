local nmap = require("chell.utils").nmap
local vmap = require("chell.utils").nmap
local tmap = require("chell.utils").tmap

nmap("<leader>w", "<cmd>w<cr>", { desc = "Write buffer" })
nmap("<leader>q", "<cmd>q<cr>", { desc = "Quit window" })

nmap("<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

nmap("<Esc>", "<cmd>nohlsearch<CR>")

nmap("|", "<cmd>vsplit<cr>")
nmap("\\", "<cmd>split<cr>")

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
nmap("]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
nmap("[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
nmap("]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
nmap("[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
nmap("]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
nmap("[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

vmap(">", ">gv")
vmap("<", "<gv")

-- tabs
nmap("<tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
nmap("<tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
nmap("<tab>L", "<cmd>tablast<cr>", { desc = "Last Tab" })
nmap("<tab>H", "<cmd>tabfirst<cr>", { desc = "First Tab" })
nmap("<tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
nmap("<tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
nmap("<tab><", "<cmd>tabm -1<cr>", { desc = "Move Tab left" })
nmap("<tab>>", "<cmd>tabm +1<cr>", { desc = "Move Tab right" })

tmap("<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
