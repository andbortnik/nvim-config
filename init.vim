"=====================================================
" Plugins
"=====================================================
call plug#begin('~/.local/share/nvim/plugged')
" common
Plug 'nvim-lua/plenary.nvim'
Plug 'tami5/sqlite.lua'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'xiyaowong/nvim-transparent'
" colorschemes
Plug 'sainnhe/sonokai'
Plug 'tanvirtin/monokai.nvim'
Plug 'matsuuu/pinkmare'
Plug 'Mofiqul/dracula.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'larsbs/vimterial_dark'
Plug 'mhartington/oceanic-next'
Plug 'navarasu/onedark.nvim'
" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" tools
Plug 'simeji/winresizer'
Plug 'camspiers/lens.vim'
Plug 'rktjmp/highlight-current-n.nvim'
Plug 'dominikduda/vim_current_word'
" git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'ray-x/lsp_signature.nvim'
" diagnostic
Plug 'rachartier/tiny-inline-diagnostic.nvim'
" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'sk1418/Join'
Plug 'drzel/vim-split-line'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
" html
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" nvim-tree-lua
Plug 'kyazdani42/nvim-tree.lua'
" fuzzy finders
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
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
" rust tools
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
" motions
Plug 'chrisgrieser/nvim-spider'
call plug#end()

"=====================================================
" Common settings
"=====================================================
colorscheme onedark
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
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
set exrc
set secure
set colorcolumn=120
set clipboard+=unnamedplus

"=====================================================
" File specific settings
"=====================================================
au FileType tex,latex set noexpandtab
au BufNewFile,BufRead *.tex set noexpandtab
au FileType html,javascript,javascriptreact set tabstop=2 shiftwidth=2
au FileType javascriptreact runtime ftplugin/html/sparkup.vim

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
" lsp
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>k :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>K :lua vim.lsp.buf.signature_help()<CR>
nnoremap <Leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <Leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap g[ :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap g] :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap ga :lua vim.lsp.buf.code_action()<CR>
" folding
nnoremap <C-]> :foldopen<CR>
nnoremap <C-[> :foldclose<CR>
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
" Move lines up and down
"nnoremap J :m .+1<CR>==
"nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Shift 
vnoremap > >gv
vnoremap < <gv
" fuzzy finders
" FZF 
nnoremap <Leader>ff :GitFiles<CR>
nnoremap <Leader>fF :Files<CR>
nnoremap <Leader>fg :GitFiles?<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fm :Maps<CR>
nnoremap <Leader>fr :Rg<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <C-p> :GFiles<CR>
" tagbar
nnoremap <F2> :TagbarToggle<CR>

function! s:getVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction

vnoremap <silent><leader>ff <Esc>:GitFiles <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>fF <Esc>:Files <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>ft <Esc>:Tags <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>fr <Esc>:Rg <C-R>=<SID>getVisualSelection()<CR><CR>
" telescope
nnoremap <leader>FH <cmd>Telescope frecency<cr>
nnoremap <leader>FF <cmd>Telescope find_files<cr>
nnoremap <leader>FG <cmd>Telescope live_grep<cr>
nnoremap <leader>FB <cmd>Telescope buffers<cr>
nnoremap <leader>FH <cmd>Telescope help_tags<cr>
" autocomplete
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
" Pytest
nmap <Leader>tp :Pytest project -n=auto
nmap <Leader>tF :Pytest file
nmap <Leader>tc :Pytest class
nmap <Leader>tm :Pytest method
nmap <Leader>tf :Pytest function
nmap <F4> :Pytest session<CR>
" leader-guide
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>
" lsp
nnoremap <Leader>li :LspInfo<CR>
nnoremap <Leader>lr :LspStart<CR>
nnoremap <Leader>ls :LspStop<CR>

lua require('init')
