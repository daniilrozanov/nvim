return {
  -- 'daniilrozanov/cmake.nvim',
  dir = "~/repositories/cmake.nvim",
  lazy = false,
  opts = { cmake = { parallel_jobs = #vim.uv.cpu_info() } },
}
