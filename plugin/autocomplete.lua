local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local cmp = require'cmp'

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    local opts = { noremap=true, silent=true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-- Setup nvim-cmp autocompletion
cmp.setup({
    snippet = {},
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
    },
    completion = {
        autocomplete = true,
        completeopt = 'menu,menuone,preview,noinsert,noselect',
    },
    sources = {
        {
            name = 'nvim_lsp',
            max_item_count = 10,
        },
        {
            name = 'tags'
        },
    },
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
          tags = "[tags]",
        })[entry.source.name]
        return vim_item
      end,
    },
})

-- Setup language servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = cmp_nvim_lsp.update_capabilities(capabilities),
        flags = {
            debounce_text_changes = 150,
        }
    }
end
