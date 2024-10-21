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
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.clangd.setup {
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
