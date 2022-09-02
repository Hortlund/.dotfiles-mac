vim.o.syntax = "on"
vim.o.nu = true 
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.autoread = true
vim.o.ma = true
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 2
vim.o.confirm = true
vim.o.autoindent = true 
vim.o.textwidth = 100
vim.o.linebreak = true
vim.o.wrap = true
--vim.o.expandtab = true

vim.cmd('filetype plugin on')

vim.cmd('set tags=./tags,tags,~/Documents/git/tags')

vim.opt.list = true
vim.opt.listchars = { tab = '>~', trail = '~', extends = '>', precedes = '<', nbsp = '%', space = '·' }

vim.api.nvim_command('autocmd BufRead,BufNewFile /Users/andreas.hortlund/Documents/git/air8/* setlocal fileencodings=iso-8859-1')
vim.api.nvim_command('au BufNewFile,BufRead *.tt set filetype=tt2html')

require('plugins')
require('tree-sitter')
require('tree-sitter-context')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Native LSP Setup
-- Global setup.
local cmp = require'cmp'
cmp.setup({
snippet = {
   expand = function(args)
     require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
   end,
},
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.perlpls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = { '/Users/andreas.hortlund/perl5/perlbrew/perls/perl-5.34.1/bin/pls' },
  settings = {
    perl = {
      inc = { '/Users/andreas.hortlund/Documents/git/air8/cgi-bin/core/lib', '/Users/andreas.hortlund/Documents/git/air8', '/Users/andreas.hortlund/Documents/git/air8/cgi-bin/core/objects' },
      cwd = { '/Users/andreas.hortlund/Documents/git/air8' }
    }
  }
}

require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

local opts = {
  on_attach = on_attach,
  flags = lsp_flags,
  -- rust-tools options
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      },
    },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
  -- https://rust-analyzer.github.io/manual.html#features
  server = {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
          },
        cargo = {
          allFeatures = true
          },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy"
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true
          },
        },
      }
    },
}
require('rust-tools').setup(opts)

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Get store
store = os.getenv("ASKAS_BUTIK")

-- lualine
require('lualine').setup{
  sections = {
    lualine_c = {{'filename', file_status = true, path = 2}},
	lualine_x = {"store",'encoding', 'fileformat', 'filetype'}
  }
}
vim.cmd[[let g:tokyonight_style = "night"]]
vim.cmd[[let g:tokyonight_italic_functions = 1]]

vim.cmd[[colorscheme tokyonight]]

--nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
--nnoremap <backspace> <C-]>
--nnoremap <tab>       <C-T>
map("n", "<backspace>", "<C-]>")
map("n", "<tab>", "<C-T>")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>f", "<cmd>Telescope grep_string<CR>")
map("n", "<Leader>s", ":<C-u>call gitblame#echo()<CR>")
map("n", "<Leader>b", ":! perl /Users/andreas.hortlund/Documents/git/air8/_VERKTYG/publish.pm %:p 1<CR>")
