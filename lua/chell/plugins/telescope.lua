return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    "rest-nvim/rest.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    pcall(require("telescope").load_extension("rest"))

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    local nmap = require("chell.utils").nmap
    nmap("<leader>fh", builtin.help_tags, { desc = "Search [H]elp" })
    nmap("<leader>fk", builtin.keymaps, { desc = "Search [K]eymaps" })
    nmap("<leader>ff", builtin.find_files, { desc = "Search [F]iles" })
    nmap("<leader>fs", builtin.builtin, { desc = "Search [S]elect Telescope" })
    nmap("<leader>fw", builtin.grep_string, { desc = "Search current [W]ord" })
    nmap("<leader>fg", builtin.live_grep, { desc = "Search by [G]rep" })
    nmap("<leader>fd", builtin.diagnostics, { desc = "Search [D]iagnostics" })
    nmap("<leader>fr", builtin.resume, { desc = "Search [R]esume" })
    nmap("<leader>f.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
    nmap("<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    nmap("<leader>f/", function()
      builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
    end, { desc = "[S]earch [/] in Open Files" })
    nmap("<leader>fn", function()
      require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Search [N]eovim files" })
    -- Shortcut for searching your Neovim configuration files
  end,
}
