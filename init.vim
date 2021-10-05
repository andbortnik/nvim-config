"=====================================================
" Common settings
"=====================================================
" tabs and spaces handling
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smartindent
set number 
set relativenumber
set scrolloff=8
set hidden
set path+=**
set title
set mouse=a
set termguicolors
set listchars=tab:→\ ,space:·
set list
set nowrap
set ignorecase
set smartcase
set updatetime=400
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let mapleader=","
" undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
" local .vimrc
set exrc
set secure


"=====================================================
" File specific settings
"=====================================================
au FileType tex,latex set noexpandtab
au BufNewFile,BufRead *.tex set noexpandtab
au FileType html,javascript,javascriptreact set tabstop=2 shiftwidth=2
au FileType javascriptreact runtime ftplugin/html/sparkup.vim


"=====================================================
" Plugin settings
"=====================================================
" colorscheme
autocmd vimenter * ++nested colorscheme gruvbox
" gruvbox
let g:gruvbox_bold = 0
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_invert_signs = 1
function! GruvboxUpdateColors()
    hi! link Function GruvboxAqua
endfunction
autocmd ColorScheme gruvbox call GruvboxUpdateColors()
" jedi-vim
let g:jedi#environment_path = $VIRTUAL_ENV
let g:jedi#smart_auto_mappings = 1
autocmd FileType python setlocal completeopt-=preview
" deoplete
let g:deoplete#enable_at_startup = 1
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" gutentags
let g:gutentags_enabled = 1
" vim-auto-save
let g:auto_save = 1
" vim-closetag
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'
" vim-signify
let g:signify_line_highlight = 0
" nvim-tree-lua
let g:nvim_tree_highlight_opened_files = 1


"=====================================================
" Mappings
"=====================================================
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <M-4> <End>
inoremap <M-0> <Home>
" buffers
noremap <M-k> :bp<CR>
noremap <M-j> :bn<CR> 
nnoremap <M-q> :bp<CR>:bd #<CR>
" windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-q> <C-w>c
" Map save to Ctrl + S
map <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>
" edit vim config
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>
" plug
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
" nvim-tree-lua
nnoremap <F3> :NvimTreeToggle<CR>
highlight NvimTreeFolderIcon guibg=blue
" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p
" Move lines up and down
"nnoremap J :m .+1<CR>==
"nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Shift 
vnoremap > >gv
vnoremap < <gv
" FZF
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fm :Maps<CR>
nnoremap <Leader>fg :GF?<CR>
nnoremap <Leader>fr :Rg<CR>
nnoremap <C-p> :GFiles<CR>
" jedi-vim
imap <C-j> <C-n>
imap <C-k> <C-p>
" make
nnoremap <Leader>m :make<CR>
" Join
nnoremap <Leader>j :Join ' '<CR>k
nnoremap <Leader>J :Join ' ' -1<CR>k
" vim-split-line
nnoremap <Leader>s :SplitLine<CR>
" undotree
nnoremap <F5> :UndotreeToggle<CR>:UndotreeFocus<CR>
" pymode-lint
nnoremap <Leader>l :PymodeLint<CR>
" autosave
let g:auto_save = 0
" lens
let g:lens#width_resize_max = 120
" signify
nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)
nnoremap <Leader>gd :SignifyDiff<CR>
nnoremap <Leader>gp :SignifyHunkDiff<CR>
nnoremap <Leader>gu :SignifyHunkUndo<CR>
" signify show hunks
autocmd User SignifyHunk call s:show_current_hunk()
function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction
" Pytest
nmap <Leader>tp :Pytest project -n=auto
nmap <Leader>tf :Pytest file
nmap <Leader>tc :Pytest class
nmap <Leader>tm :Pytest method
nmap <Leader>tf :Pytest function
nmap <Leader>ts :Pytest session<CR>

"=====================================================
" Plugins
"=====================================================
call plug#begin('~/.local/share/nvim/plugged')
" appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'camspiers/lens.vim'
" colorschemes
Plug 'sainnhe/sonokai'
Plug 'https://git.sr.ht/~novakane/kosmikoa.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'matsuuu/pinkmare'
Plug 'Mofiqul/dracula.nvim'
Plug 'morhetz/gruvbox'
Plug 'larsbs/vimterial_dark'
Plug 'mhartington/oceanic-next'
" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'sk1418/Join'
Plug 'drzel/vim-split-line'
Plug 'alvan/vim-closetag'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
" html
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" nvim-tree-lua
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" FZF
Plug 'junegunn/fzf', { 'do': './install --all && ln -sf $(pwd) ~/.fzf'}
Plug 'junegunn/fzf.vim'
" Pytest
Plug 'alfredodeza/pytest.vim'
" JS
Plug 'neoclide/vim-jsx-improve'
" TaTeX
Plug 'lervag/vimtex'
" undo
Plug 'mbbill/undotree'
"tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
" other
Plug 'andymass/vim-matchup'
Plug 'spinks/vim-leader-guide'
Plug '907th/vim-auto-save'
" russian layout
Plug 'powerman/vim-plugin-ruscmd'

call plug#end()

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
      enable = true,              -- false will disable the whole extension
      disable = { "c", "rust" },  -- list of language that will be disabled
    },
}
EOF

" monokai
" lua << EOF
" local monokai = require('monokai')
" local palette = monokai.classic
" monokai.setup {
"     palette = {
"     },
"     custom_hlgroups = {
"         TSParameter = {
"             fg = palette.orange,
"         },
"         TSParameterReference = {
"             fg = palette.orange,
"         }
"     }
" }
" EOF

" nvim-tree-lua
lua << EOF
require'nvim-tree'.setup {
    open_on_setup = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    }
}
EOF

" ------------------------------------------------- 
" LSP
" ------------------------------------------------- 
lua << EOF
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
local cmp = require'cmp'
cmp.setup({
    snippet = {},
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    completion = {
        autocomplete = true,
        completeopt = 'menu,menuone,noinsert',
    },
    sources = {
        {
            name = 'nvim_lsp',
            max_item_count = 10,
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
        })[entry.source.name]
        return vim_item
      end,
    },
})

-- Setup language servers
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
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
EOF
