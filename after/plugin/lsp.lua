require("mason").setup()
require("mason-lspconfig").setup()
local Remap = require("connor.keymaps")
local nnoremap = Remap.nnoremap

local luasnip = require'luasnip'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip/loaders/from_vscode").lazy_load()

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- Set up nvim-cmp.
local cmp = require('cmp')
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function (entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
            { name = 'buffer' },
        }),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
})

local on_attach_custom = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    nnoremap('gD', vim.lsp.buf.declaration)
    nnoremap('gd', vim.lsp.buf.definition)
    nnoremap('K', vim.lsp.buf.hover)
    nnoremap('gi', vim.lsp.buf.implementation)
    nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder)
    nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder)
    nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder)
    nnoremap('<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    nnoremap('<space>D', vim.lsp.buf.type_definition)
    nnoremap('<space>rn', vim.lsp.buf.rename)
    nnoremap('<space>rn', vim.lsp.buf.rename)
    nnoremap('gr', vim.lsp.buf.references)
    nnoremap('<space>fm', vim.lsp.buf.formatting)
    nnoremap('ca', vim.lsp.buf.code_action)

end
-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

require'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach_custom,
}

-- -- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--all-scopes-completion=false",
        "--header-insertion=never",
        "--limit-results=15",
    },
    -- on_attach = on_attach_custom,
    on_attach = function(client, bufnr)
        on_attach_custom(client,bufnr)
        nnoremap("<leader>th", ":ClangdSwitchSourceHeader<CR>")
    end
}


require'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach_custom,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require'lspconfig'.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach_custom,
}

require'lspconfig'.bashls.setup{
    capabilities = capabilities,
    on_attach = on_attach_custom,
}
-- local util = require('lspconfig.util')
-- vim.diagnostic.config(
--     { virtual_text = false }
--     -- vim.diagnostic.get_namespace(require('lspconfig').sumneko_lua.get_namespace())
-- )

