" General {
"
    " Automatic reloading of .vimrc
    autocmd! bufwritepost .vimrc source %"

    " Default script encoding
    scriptencoding utf-8

    " Enable mouse
    "set mouse=a

    " Better Unix / Windows compatibility
    set viewoptions=folds,options,cursor,unix,slash

    " Allow for cursor beyond last character
    set virtualedit=onemore

    " Store a ton of history (default is 20)
    set history=1000

    " Spell checking on
    " set spell

    " Allow buffer switching without saving
    set hidden

    " '.' is an end of word designator
    set iskeyword-=.

    " '#' is an end of word designator
    set iskeyword-=#

    " '-' is an end of word designator
    set iskeyword-=-

    " Disable backup files
    set nobackup
    set noswapfile

    " insert tabs on the start of a line according to shiftwidth, not tabstop
    set smarttab

"}

" Vim UI {
"

    " Only show 15 tabs
    set tabpagemax=15

    " Display the current mode
    set showmode

    " Highlight current line
    set cursorline

    " SignColumn should match background
    highlight clear SignColumn

    " Current line number row will have same background color in relative mode
    highlight clear LineNr

    if has('cmdline_info')
        " A ruler on steroids
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        " Show partial commands in status line and Selected characters/lines in visual mode
        set showcmd
    endif

    if has('statusline')
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    " Backspace for dummies
    set backspace=indent,eol,start

    " No extra spaces between rows
    set linespace=0

    " Line numbers on
    set nu

    " Show matching brackets/parenthesis
    set showmatch

    " Find as you type search
    set incsearch

    " Highlight search terms
    set hlsearch

    " Windows can be 0 line high
    set winminheight=0

    " Case insensitive search
    set ignorecase

    " Case sensitive when uc present
    set smartcase

    " Show list instead of just completing
    set wildmenu

    " Command <Tab> completion, list matches, then longest common part, then all
    set wildmode=list:longest,full
    set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so

    " Backspace and cursor keys wrap too
    set whichwrap=b,s,h,l,<,>,[,]

    " Lines to scroll when cursor leaves screen
    set scrolljump=5

    " Minimum lines to keep above and below cursor
    set scrolloff=3

    " Disable auto fold code
    set nofoldenable

    set list

    " Highlight problematic whitespace
    set listchars=tab:▷\ ,trail:•,extends:#,nbsp:.

    " Highlight only the lines that go past 80 characters
    highlight ColorColumn ctermbg=red guibg=red
    call matchadd('ColorColumn', '\%122v', 100)

"}

" Formatting {
"
    " Do not wrap long lines
    "set nowrap

    " Indent at the same level of the previous line
    set autoindent

    " Copy the previous indentation on autoindenting
    set copyindent

    " Use indents of 4 spaces
    set shiftwidth=4

    " Tabs are spaces, not tabs
    set expandtab

    " An indentation every four columns
    set tabstop=4

    " Let backspace delete indent
    set softtabstop=4

    " Prevents inserting two spaces after punctuation on a join (J)
    set nojoinspaces

    " Puts new vsplit windows to the right of the current
    set splitright

    " Puts new split windows to the bottom of the current
    set splitbelow

    " Better copy & paste
    " When you want to paste large blocks of code into vim, press F2 before
    " you paste.
    set pastetoggle=<F2>

    " Get that filetype stuff happening
    filetype on
    filetype plugin on
    filetype indent on

    " Setting to automatically remove trailing whitespace when saving a file
    autocmd BufWritePre * :%s/\s\+$//e

" }


" Key maps {
"
    " Removes highlight of your last search"
    noremap <C-n> :nohl<CR>
    vnoremap <C-n> :nohl<CR>
    inoremap <C-n> :nohl<CR>

    " Easy paste from system clipboard
    nnoremap <Leader>p "+p
    nnoremap <Leader>P "+P

    " Easy copy to system clipboard
    vnoremap <Leader>y "+y
    nnoremap <Leader>y "+y

    " Easier moving of code blocks
    vnoremap < <gv
    vnoremap > >gv


    " "Fast quickfix navigation
    " nnoremap <Leader>n :cnext<CR>
    " nnoremap <Leader>N :cprev<CR>

    " "Substitute word under cursor
    " nnoremap <Leader>s yiw:%s,<C-r>",
    "
    " "vimgrep word under cursor
    " nnoremap <Leader>g yiw:vimgrep /<C-r>"/g

    " To open a new empty buffer
    " This replaces :tabnew which I used to bind to this mapping
    nmap <c-n> :enew<CR>
    " Show all open buffers and their status
    nmap <leader>bl :ls<CR>"
    " Move to the next buffer
    nmap <c-l> :bnext<CR>
    " Move to the previous buffer
    nmap <c-h> :bprevious<CR>
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <c-k> :bp <BAR> bd #<CR>

"}

" Plugins {
"
    " Set up Vundle
    " git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    " Be iMproved, required
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " Let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " General

    " Install chrisbra/vim-diff-enhanced {
        Plugin 'chrisbra/vim-diff-enhanced'
    "}

    " Install tpope/vim-surround {
        " Surround.vim is all about "surroundings": parentheses, brackets, quotes,
        " XML tags, and more. The plugin provides mappings to easily delete,
        " change and add such surroundings in pairs.
        "  Press <Leader>cs"' inside
        " "Hello world!"
        " <Leader>cs"' : Change " to '
        " to change it to
        " 'Hello world!'
        " To remove the delimiters entirely, press <Leader>ds'
        " Hello world!
        Plugin 'tpope/vim-surround'
    "}

    " Install flazz/vim-colorschemes {
        " This is harvested from vim.org. Only colorschemes downloaded in a single .vim file are included.
        Plugin 'flazz/vim-colorschemes'
    "}

    " Install Lokaltog/vim-easymotion {
        " EasyMotion provides a much simpler way to use some motions in vim. It
        " takes the <number> out of <number>w or <number>f{char} by highlighting
        " all possible choices and allowing you to press one key to jump directly
        " to the target.
        " <Leader><Leader>w
        " <Leader><Leader>s
        " <Leader><Leader>e
        Plugin 'Lokaltog/vim-easymotion'
    "}

    " Install bling/vim-airline {
        " Lean & mean status/tabline for vim that's light as air.
        Plugin 'bling/vim-airline'
    "}

    " Install kien/ctrlp {
        " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
        " Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
        " Press <c-f> and <c-b> to cycle between modes.
        " Press <c-d> to switch to filename only search instead of full path.
        " Press <c-r> to switch to regexp mode.
        " Use <c-j>, <c-k> or the arrow keys to navigate the result list.
        " Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
        " Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
        " Use <c-y> to create a new file and its parent directories.
        " Use <c-z> to mark/unmark multiple files and <c-o> to open them.
        Plugin 'kien/ctrlp.vim'
    "}

    " Install osyo-manga/vim-over {
        " Is a plug-in that highlights the {pattern} parameter from |:substitute| {pattern}.
        Plugin 'osyo-manga/vim-over'
    "}

    " Programming

    " Install godlygeek/tabular {
        Plugin 'godlygeek/tabular'
    "}

    " Install scrooloose/nerdcommenter {
        " Vim plugin for intensely orgasmic commenting.
        " <Leader>cc - Comment out the current line or text selected in visual mode.
        " <Leader>cn - Same as <leader>cc but forces nesting.
        " <Leader>c - Toggles the comment state of the selected line(s). If the
        " topmost selected line is commented, all selected lines are uncommented
        " and vice versa.
        " <Leader>cm - Comments the given lines using only one set of multipart delimiters.
        " <Leader>ci - Toggles the comment state of the selected line(s) individually.
        " <Leader>cs - Comments out the selected lines "sexily"
        " <Leader>cy - Same as <leader>cc except that the commented line(s) are
        " yanked first.
        " <Leader>c$ - Comments the current line from the cursor to the end of line.
        " <Leader>cA - Adds comment delimiters to the end of line and goes into
        " insert mode between them.
        " <Leader>ca - Switches to the alternative set of delimiters.
        " <Leader>cl - Delimiters are aligned down the left side.
        " <Leader>cb - Delimiters are aligned down the both sides.
        " <Leader>cu - Uncomments the selected line(s).
        Plugin 'scrooloose/nerdcommenter'
    "}


    " Install scrooloose/syntastic {
        " Syntastic is a syntax checking plugin for Vim that runs files through
        " external syntax checkers and displays any resulting errors to the user.
        Plugin 'scrooloose/syntastic'
    "}

    " Install nathanaelkane/vim-indent-guides {
        " Indent Guides is a plugin for visually displaying indent levels in Vim
       " Plugin 'nathanaelkane/vim-indent-guides'
    "}

    Plugin 'Yggdroot/indentLine'

    " Install gcmt/wildfire {
        " With Wildfire you can quickly select the closest text object among a
        " group of candidates
        Plugin 'gcmt/wildfire.vim'
    "}

    " Install Shougo/neocomplcache {
        Plugin 'Shougo/neocomplcache'
    "}

    " Install Shougo/neosnippet {
        Plugin 'Shougo/neosnippet'
    "}

    " Install Shougo/neosnippet-snippets {
        Plugin 'Shougo/neosnippet-snippets'
    "}

    " Install Shougo/neosnippet-snippets {
        Plugin 'scrooloose/nerdtree'
    "}

    " All of your Plugins must be added before the following line
    call vundle#end()
    filetype plugin indent on
"}


" Plugins Settings {
"

    "Yggdroot/indentLine
    let g:indentLine_color_term = 237
    let g:indentLine_char = '│'
    let g:indentLine_faster = 1

    " Settings for vim-colorschemes {
        if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/wombat256mod.vim"))
            syntax enable
            set background=dark
            set t_Co=256
            colorscheme wombat256mod
            hi CursorLine  ctermbg=8
        endif
    "}

    " Settings for vim-airline {
        if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
            set laststatus=2
            " let g:airline_theme = 'wombat'
            let g:airline_powerline_fonts = 1
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#fnamemod = ':t'
            let g:airline#extensions#syntastic#enabled = 1
            let g:airline#extensions#branch#enabled = 1
        endif
    "}

    " Settings for ctrlp {
        if filereadable(expand("~/.vim/bundle/ctrlp.vim/plugin/ctrlp.vim"))
            let g:ctrlp_max_height = 30
            set wildignore+=*.pyc
            set wildignore+=*_build/*
            set wildignore+=*/coverage/*
        endif
    "}

    " Settings for Tabularize {
        if filereadable(expand("~/.vim/bundle/tabular/plugin/Tabular.vim"))
            nmap <Leader>a" :Tabularize /"<CR>
            vmap <Leader>a" :Tabularize /"<CR>
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /=<CR>
            vmap <Leader>a= :Tabularize /=<CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    "}

    " Settings for syntastic {
        if filereadable(expand("~/.vim/bundle/syntastic/plugin/syntastic.vim"))
            set statusline+=%#warningmsg#
            set statusline+=%{SyntasticStatuslineFlag()}
            set statusline+=%*
            let g:syntastic_always_populate_loc_list=1
            let g:syntastic_error_symbol = '✗'
            let g:syntastic_warning_symbol = '⚠'
            let g:syntastic_auto_loc_list = 2
            let g:syntastic_enable_signs = 1
            let g:syntastic_check_on_wq = 0
        endif
    "}
    " Settings for indent-guides {
        if filereadable(expand("~/.vim/bundle/vim-indent-guides/plugin/indent_guides.vim"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    "}

    " Settings for Wildfire {
        if filereadable(expand("~/.vim/bundle/wildfire.vim/plugin/wildfire.vim"))
            let g:wildfire_objects = {
                                    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
                                    \ "html,xml" : ["at"],
                                    \ }
        endif
    "}

    " Settings for neocomplcache {
        if filereadable(expand("~/.vim/bundle/neocomplcache/plugin/neocomplcache.vim"))
            let g:acp_enableAtStartup = 0
            let g:neocomplcache_enable_at_startup = 1
            let g:neocomplcache_enable_camel_case_completion = 1
            let g:neocomplcache_enable_smart_case = 1
            let g:neocomplcache_enable_underbar_completion = 1
            let g:neocomplcache_enable_auto_delimiter = 1
            let g:neocomplcache_max_list = 15
            let g:neocomplcache_force_overwrite_completefunc = 1
            if !exists('g:neocomplcache_keyword_patterns')
                let g:neocomplcache_keyword_patterns = {}
            endif
            let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

            " Enable omni completion
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

            " Better navigating through omnicomplete option list
            " See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
            set completeopt=longest,menuone
            function! OmniPopup(action)
                if pumvisible()
                    if a:action == 'j'
                        return "\<C-N>"
                    elseif a:action == 'k'
                        return "\<C-P>"
                    endif
                endif
                return a:action
            endfunction
        endif
    "}

    " Settings for neosnippet
        if filereadable(expand("~/.vim/bundle/neosnippet/plugin/neosnippet.vim"))
            let g:neosnippet#enable_snipmate_compatibility = 1
            imap <C-k>     <Plug>(neosnippet_expand_or_jump)
            smap <C-k>     <Plug>(neosnippet_expand_or_jump)
            xmap <C-k>     <Plug>(neosnippet_expand_target)
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif
        endif
    "}

    autocmd vimenter * NERDTree

"}
