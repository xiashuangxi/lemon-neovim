" License {
"
"   _                                         _   _         __     ___           
"  | |    ___ _ __ ___   ___  _ __           | \ | | ___  __\ \   / (_)_ __ ___  
"  | |   / _ \ '_ ` _ \ / _ \| '_ \   _____  |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
"  | |__|  __/ | | | | | (_) | | | | |_____| | |\  |  __/ (_) \ V / | | | | | | |
"  |_____\___|_| |_| |_|\___/|_| |_|         |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"  
" 	这是 xiashuangxi 的个人 init.vim 文件，这里配置了大部分基础的设置。
"
"	MIT License
"
"	Copyright (c) xiashuangxi<xiashuangxi@hotmail.com>
" 	
" 	Permission is hereby granted, free of charge, to any person obtaining a copy
" 	of this software and associated documentation files (the "Software"), to deal
" 	in the Software without restriction, including without limitation the rights
" 	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" 	copies of the Software, and to permit persons to whom the Software is
" 	furnished to do so, subject to the following conditions:
" 	
" 	The above copyright notice and this permission notice shall be included in all
" 	copies or substantial portions of the Software.
" 	
" 	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" 	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" 	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" 	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" 	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" 	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" 	SOFTWARE.
" }

" 环境 {
	
	" 平台识别 {
		silent function! OSX()
			return has('macunix')
		endfunction

		silent function! Linux()
			return has('unix') && !has('macunix') && !has('win32unix')
		endfunction

		silent function! Windows()
			return (has('win32') || has('win64'))
		endfunction
	" }

	" 全局变量 {
	" 	if Windows()
	" 		let $VIMFILES=$HOME.'/AppData/Local/nvim'
	" 	else
	" 		let $VIMFILES=$HOME.'/.nvim/
	" 	endif
	" " }
" }


" 通用配置 {

	set background=dark						" 将背景设置为 dark
	filetype plugin indent on 				" 自动检测文件类型
	syntax on 								" 语法高亮显示
	set mouse=a								" 自动开启使用鼠标
	set mousehide							" 输入时隐藏鼠标光标
	" set viewoptions=folds,options,cursor,unxi,slash	
											" 更好的兼容 Unix/Windows
	set history=1000						" 存储最大历史记录（默认20）
	" set spell								" 拼写检查 

" }

" NeoVim 界面 {

	" colorscheme gruvbox						
	set tabpagemax=15						" 最多显示 15 个 tab
	set showmode							" 显示当前模式
	set cursorline 							" 突出显示当前行

	set textwidth=0							" 在第 80 个字符位置显示分线									
	if exists('&colorcolumn')
		set colorcolumn=80
	endif

	" 设置状态栏
	if has('statusline')
		set laststatus=2

		set statusline=%<%f\
		set statusline+=%w%h%m%r

		set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():'='}

		set statusline+=\ [%{&ff}/%Y]
		set statusline+=\ [%{getcwd()}]
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%
	endif

	set number								" 显示行号
	set relativenumber						" 相对行号
	set showmatch							" 显示匹配的括号
	set incsearch							" 键入时查找
	set hlsearch							" 突出显示搜索字词
	set ignorecase							" 不区分大小写搜索
	set wildmenu							" 显示列表，而不只是写成列表
	set foldenable							" 自动折叠代码

" }

" 格式化 {

	set nowrap
	set autoindent
	set shiftwidth=4
	set expandtab
	set tabstop=4
	set softtabstop=4
	set splitright							" 新 vsplit 窗口放在当前窗口的右侧
	set splitbelow							" 将新 split 的窗口置于当前窗口的底部

	autocmd FileType yml setlocal expandtab shiftwidth2 softtabstop=2
" }

" 插件 {

	if Windows()
		let g:plugged_home = '~/AppData/Local/nvim/plugged'
		if filereadable(expand('~/AppData/Local/nvim/vim-plug.vim'))
			source ~/AppData/Local/nvim/vim-plug.vim
		endif
	endif

	" gruvbox {
		" colorscheme gruvbox
	" }

	" vim-github-colorscheme {
		" colorscheme github
	" }

	" vim-colors-github {
		colorscheme github
		" let g:airline_theme = 'dark_minimal'
		let g:lightline = {'colorscheme': 'github'}
		let g:github_colors_soft = 1
		let g:github_colors_block_diffmark = 0
	" }

	" airline-theme {
		let g:airline#extensions#tabline#buffer_nr_show=1
		let g:airline_section_y = "%{exists('g:loaded_fugitive')?fugitive#statusline():'='}%m%r%{strftime('%H:%M')}"
		let g:airline_section_b = 'BN: %{bufnr("%")}'
		let g:airline_theme = 'dark_minimal'
	" }

" }

" 界面设置 {

	" if has('gui_running')
		" set guioptions-=T
		" set lines=40

		" if Linux() && has("gui_running")
        "     set guifont=Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        " elseif OSX() && has("gui_running")
        "     set guifont=Consolas\ Regular:h12,Courier\ New\ Regular:h14
        " elseif Windows() && has("gui_running")
            " set guifont=Consolas:h8,Courier_New:h8
    "     endif
	" endif

" }