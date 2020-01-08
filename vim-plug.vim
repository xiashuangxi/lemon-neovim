"" =============================================================================
"" Copyright (c) xiashuangxi<xiashuangxi@hotmail.com>
"" License: MIT
"" DateTime: 2020/01/01
"" 
"" 插件管理
"" =============================================================================

call plug#begin(g:plugged_home)
    " Plug 'tpope/vim-fugitive'
    " Plug 'autozimu/LanguageClient-neovim',{'branch': 'next', 'do': 'bash install.sh'}
    " Plug 'norcalli/nvim-colorizer.lua'

    "" 主题
    " Plug 'morhetz/gruvbox'
    " Plug 'endel/vim-github-colorscheme'
    Plug 'cormacrelf/vim-colors-github'
    " Plug 'vim-airline/vim-airline-themes'

    " Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go
call plug#end()
