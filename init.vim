" set runtimepath^=~/.vim runtimepath+=~/.vim/after

" execute pathogen#infect()

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" Crystal
Plug 'vim-crystal/vim-crystal'

" Plug 'mhinz/vim-mix-format'
Plug 'jremmen/vim-ripgrep'

Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

" Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'ziglang/zig.vim'
Plug 'morhetz/gruvbox'

Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'

" Plug 'crusoexia/vim-monokai'
" Plug 'ajmwagar/vim-deus'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" syntax master pack
Plug 'sheerun/vim-polyglot'
" Plug 'iCyMind/NeoSolarized'
Plug 'rakr/vim-one'
Plug 'sainnhe/everforest'
Plug 'rafi/awesome-vim-colorschemes'

" QoL
Plug 'tpope/vim-surround'

" Haskell
Plug 'sbdchd/neoformat'
" Plug 'neovimhaskell/haskell-vim'

" Initialize plugin system
call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
set termguicolors
filetype plugin indent on

" let g:airline_theme='one'
let g:one_allow_italics = 1 " I love italic for comments
colorscheme solarized8
" colorscheme onedark
" colorscheme deus
" colorscheme molokai
" colorscheme base16-atelier-dune
" colorscheme gruvbox
" colorscheme base16-default-dark

set background=dark
" let g:everforest_background = 'hard'
" let g:everforest_enable_italic = 1
" colorscheme everforest

if has("nvim")
  " show substitutions incrementally
  set inccommand=nosplit
endif

" nvim-compe
" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.resolve_timeout = 800
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true
" 
" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
" nvim-compe

" Restrict this weird plugin
let g:jsx_ext_required = 1
let g:airline_powerline_fonts = 1

set number
set relativenumber
set autoread
" match Error /\%151v.\+/
:set cc=100

"Settings for CommandT
"1. Ignore node_modules
:set wildignore+=*/coverage/*
:set wildignore+=*/node_modules/*
:set wildignore+=*/tmp/*
:set wildignore+=*.class

" set wrap
" set textwidth=79
set scrolloff=10
set nowrap

"Highlight the nonsense characters
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" The most important part
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Change cursor shape between insert and normal mode in iTerm2.app
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set cursorline
hi CursorLine ctermbg=236

" fzf / fzf-vim settings
" In Neovim, you can set up fzf window using a Vim command
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" NERDTree settings
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
nmap <F6> :NERDTreeToggle<CR>




" source ~/.vimrc

lua << EOF
-- Setup our autocompletion. These configuration options are the default ones
-- copied out of the documentation.
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 500,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    -- vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    -- spell = true,
    -- tags = true,
    treesitter = true
  }
}

-- local lspconfig = require("lspconfig")
-- 
-- local path_to_elixirls = vim.fn.expand("/Users/biswarupchakravarty/Projects/elixir-ls/release/language_server.sh")
-- 
-- lspconfig.elixirls.setup({
--   cmd = {path_to_elixirls},
--   -- capabilities = capabilities,
--   -- on_attach = on_attach,
--   settings = {
--     elixirLS = {
--       -- I choose to disable dialyzer for personal reasons, but
--       -- I would suggest you also disable it unless you are well
--       -- aquainted with dialzyer and know how to use it.
--       dialyzerEnabled = false,
--       -- I also choose to turn off the auto dep fetching feature.
--       -- It often get's into a weird state that requires deleting
--       -- the .elixir_ls directory and restarting your editor.
--       fetchDeps = true
--     }
--   }
-- })

-- require'lspconfig'.crystalline.setup{
--   cmd = {vim.fn.expand("/Users/biswarupchakravarty/Projects/crystalline")}
-- }

-- local path_to_scry = vim.fn.expand("/Users/biswarupchakravarty/Projects/scry/bin/scry")
-- require'lspconfig'.scry.setup({
--   cmd = {path_to_scry}
-- })
EOF


" ======= ZIG SETTINGS ===========
" ======= ZIG SETTINGS ===========
let g:zig_fmt_autosave = 1
:lua << EOF
    local lspconfig = require('lspconfig')

    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('completion').on_attach()
    end

    local servers = {'zls'}
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = on_attach,
        }
    end
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Enable completions as you type
let g:completion_enable_auto_popup = 1
" ======= ZIG SETTINGS ===========
" ======= ZIG SETTINGS ===========

" -- Zig Configuration
" let g:LanguageClient_serverCommands = {
"        \ 'zig': ['/Users/biswarupchakravarty/Projects/zls/zig-out/bin/zl'],
"        \ }
" :lua << EOF
"     local lspconfig = require('lspconfig')
" 
"     local on_attach = function(_, bufnr)
"         vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
"         require('completion').on_attach()
"     end
" 
"     local servers = {"/Users/biswarupchakravarty/Projects/zls/zig-out/bin/zls"}
"     for _, lsp in ipairs(servers) do
"         lspconfig[lsp].setup {
"             on_attach = on_attach,
"         }
"     end
" EOF
" 
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" 
" " Enable completions as you type
" let g:completion_enable_auto_popup = 1
" " -- Zig Config
