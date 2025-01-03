local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local cmp = require'cmp'

-- Setup nvim-cmp autocompletion
cmp.setup({
    snippet = {},
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<C-j>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
           end
        end,
        ['<C-k>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
           end
        end
    },
    completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
        completeopt = 'menuone,noselect',
    },
    sources = {
        {
            name = 'nvim_lsp',
            max_item_count = 15,
        },
        {
            name = 'tags',
            max_item_count = 15,
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
lspconfig.pyright.setup {
    capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = {
        debounce_text_changes = 150,
    }
}

lspconfig['rust_analyzer'].setup({
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

lspconfig['ccls'].setup {
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
          threads = 0;
        };
        clang = {
          excludeArgs = { "-frounding-math"} ;
        };
    };
    cache = {
      directory = ".ccls-cache";
    };
}

lspconfig['elixirls'].setup {
    cmd = { "elixir-ls" },
    on_attach = on_attach
}

lspconfig['tailwindcss'].setup {}

local signature_cfg = {
    bind = true,
    handler_opts = {
        border = "rounded"
    }
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if vim.tbl_contains({ 'null-ls' }, client.name) then  -- blacklist lsp
      return
    end
    require("lsp_signature").on_attach(signature_cfg, bufnr)
  end,
})
