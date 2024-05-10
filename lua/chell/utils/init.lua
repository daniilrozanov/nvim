local utils = {}

utils.map = vim.keymap.set

function utils.imap(lhs, rhs, opts)
  utils.map("i", lhs, rhs, opts)
end

function utils.nmap(lhs, rhs, opts)
  utils.map("n", lhs, rhs, opts)
end

function utils.vmap(lhs, rhs, opts)
  utils.map("v", lhs, rhs, opts)
end

function utils.tmap(lhs, rhs, opts)
  utils.map("t", lhs, rhs, opts)
end

return utils
