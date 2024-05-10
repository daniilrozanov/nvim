return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local nmap = require("chell.utils").nmap
        local builtin = require("telescope.builtin")
        nmap("gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
        nmap("gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
        nmap("gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
        nmap("<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
        nmap("<leader>ls", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
        nmap("<leader>lw", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace Symbols" })
        nmap("<leader>lr", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
        nmap("<leader>la", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
        nmap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        nmap("gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

        -- The following two autocommands are used to highlight references of the word under cursor
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        -- The following autocommand is used to enable inlay hints in
        -- code, if the language server you are using supports them
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          nmap("<leader>Th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, { desc = "[T]oggle Inlay [H]ints" })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- Enable the following language servers
    local servers = {
      clangd = {
        filetypes = { "c", "cpp", "cxx", "objc", "objcpp", "cuda", "proto" },
      },
      -- pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    -- Ensure the servers and tools above are installed
    require("mason").setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua", -- Used to format Lua code
      "clangd",
      "neocmake",
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
