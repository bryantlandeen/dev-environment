call plug#begin()
    " Plug 'preservim/nerdtree'
    Plug 'nvim-tree/nvim-tree.lua'

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    " Plug 'Raimondi/delimitMate'
    Plug 'morhetz/gruvbox'
    Plug 'windwp/nvim-autopairs'

    " status line
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " lsp plugins 
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'onsails/lspkind-nvim'

    " telescope plugin
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

lua require("connor")

" edit comments
autocmd FileType c,cpp,java setlocal commentstring=//\ %s
autocmd FileType vhdl setlocal commentstring=--\ %s
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
