-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  handlers = {
      ["textDocument/sinatureHelp"] = function() end
  },
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false -- this doesn't work
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- Vue language options (volar)
lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

-- rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach;
  capabilities = capabilities,
  filetypes = {"rust"},
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true, }
    }
  }
})

--python
lspconfig.pyright.setup({
  on_attach = on_attach;
  capabilities = capabilities,
  filetypes = {"python"},
})
