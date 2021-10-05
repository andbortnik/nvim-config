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
