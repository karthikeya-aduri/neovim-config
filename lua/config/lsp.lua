require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed={ "lua_ls", "html", "pylsp" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require'lspconfig'
lspconfig.lua_ls.setup{
    capabilities=capabilities,
    settings = {
        Lua = {
            diagnostics={
                globals={ "vim", "dark" },
            },
        }
    },
}
lspconfig.html.setup{
    capabilities = capabilities,
}
lspconfig.pylsp.setup{
    capabilities = capabilities,
}

local kmap = vim.keymap.set
kmap("n", "K", vim.lsp.buf.hover,{})
kmap("n", "<leader>gd", vim.lsp.buf.definition,{})
kmap("n", "<leader>dj", vim.diagnostic.goto_next,{})
kmap("n", "<leader>dk", vim.diagnostic.goto_prev,{})
kmap({"n","v"}, "<leader>ca", vim.lsp.buf.code_action,{})
kmap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>",{})

vim.opt.completeopt = {"menu","menuone","noselect"}
local cmp = require'cmp'

cmp.setup({
    snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        }, {
        { name = 'buffer' },
    })
})
