return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- Disable Tailwind CSS color previews (background on class names like bg-zinc-800)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and (client.name == 'tailwindcss' or client.name == 'cssls') then vim.lsp.document_color.enable(false, { client_id = client.id }) end
      end,
    })

    local servers = {
      ts_ls = {},
      cssls = {
        settings = {
          css = {
            validate = true,
            lint = { unknownAtRules = 'ignore' },
            remoteStyleSheets = false,
          },
        },
      },
      dockerls = {},
      html = {},
      jsonls = {},
      phpactor = {},
      tailwindcss = {},
    }

    local ensure_installed = vim.tbl_keys(servers)

    require('mason-lspconfig').setup {
      ensure_installed = ensure_installed,
      automatic_installation = true,
    }

    for name, server in pairs(servers) do
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end
  end,
}
