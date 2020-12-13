" =================
" Basics / 基础设置
" =================
set nocompatible
scriptencoding utf-8

" ==================
" General / 一般设置
" =================
set background=dark           " Assume a dark background / 深色主题
filetype plugin indent on       " Automatically detect file type / 自动探测文件格式
syntax on                       " Syntax highlighting / 开启语法高亮
set mouse=a                   " Enable mouse usage / 可使用鼠标按键
set mousehide                   " Hide the mouse cursor while typing / 自动隐藏鼠标

if has('clipboard')
    if has('unnamedplus')       " use '+'/'*' register for copy-paste / 使用 '+'/'*'寄存器代替无名寄存器
        set clipboard=unnamed,unnamedplus
    else                        " use '*' register for copy-paste / 使用 '*'寄存器代替无名寄存器
        set clipboard=unnamed
    endif
endif

set shortmess+=filmnrxoOtT    " Abbrev. of messages / 缩短一些提示信息
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore       " Allow for cursor beyond last character / 运行光标超过字符
set history=1000              " Store a ton of history / 增加历史记录的大小
set nospell                     " spell checking off / 关闭拼写检查
set hidden                      " Allow buffer switching without saving / 运行缓冲区隐藏, 而无需立即保存
set iskeyword-=.              " '.' is an end of word designator / '.' 不再作为一个word的结尾
set iskeyword-=#              " '#' is an end of word designator / '#' 不再作为一个word的结尾
set iskeyword-=-              " '-' is an end of word designator / '-' 不再作为一个word的结尾

" set cursor to the first line when editing a git commit message
" 当编辑一个git的commit消息时, 光标位于开始
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set backup                      " enable bakcup / 启动备份功能
set backupdir=./.tmp,~/.tmp   " Backup files are stored in the current directory first, followed by the user directory
                                " 备份文件优先保存在当前目录下, 其次是用户目录
if has('persistent_undo')
    set undofile                " enable undo file / 启用撤销文件
    set undolevels=1000       " Maximum number of changes that can be undone / 最大可撤销次数
    set undoreload=10000      " Maximun number lines to save for undo on a buffer reload / 重载缓冲区可保存的撤销行数
endif

" =============
" UI / 界面设置
" =============
colorscheme molokai
set tabpagemax=15             " Only show 15 tabs / 最多打开15个tab
set showmode                    " Display the current mode / 显示当前模式

set cursorline                  " Highlight current line / 高亮显示当前行
highlight clear SignColumn      " SignColumn should match background / 不高亮当前列
highlight clear LineNr          " Current line number column should match background / 不高亮当前行的数字

if has('cmdline_indo')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd                 " show partial commands in status line / 显示部分命令到状态栏
endif

if has('statusline')
    set laststatus=2          " Show statusline always / 总是显示状态栏
    set statusline=%<%f\                      " Filename / 文件名
    set statusline+=%w%h%m%r                  " Options / 设置
    set statusline+=\ [%{&ff}/%Y]             " Filetype / 文件类型
    set statusline+=\ [%{getcwd()}]           " Current dir / 当前目录
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%   " Right aligned file nav info / 右对齐文件导航信息
endif

set backspace=indent,eol,start    " Backspace for dummies / 退格键可删除换行符, 制表符
set linespace=0                   " No extra spaces between rows / 行之间的像素为0
set number                          " Line numbers on / 显示行数
set showmatch                       " Show matching brackets/parenthesis / 显示匹配的括号
set incsearch                       " Find as you type search / 在搜索时立即显示匹配的位置
set hlsearch                        " Highlight search terms / 高亮显示所有匹配项
set winminheight=0                " Windows can be 0 line high / 窗口高度可为 0
set ignorecase                      " Case insensitive search / 搜索时, 大小写不敏感
set smartcase                       " Case sensitive when uc present / 搜索文字中包含大写, 大小写敏感
set completeopt=menu              " No display preview window when completing / 补全时不显示额外预览窗口
set wildmenu                        " Show list instead of just completion / 显示补全列表
set wildmode=list:longest,full    " Command <Tab> Completion, list macthes, then longest common part, then all 
                                    " Tab 键补全, 补全列表最长
set scrolljump=5                  " Lines to scroll when cursor leaves screen / 光标离开屏幕滚动的行
set scrolloff=3                   " Minimun lines to keep above and below cursor / 光标上方和下方保持最少的行
set foldenable                      " Auto fold mode / 自动折叠模式
set list                            " Display non-displayable characters / 显示不可显示字符
set listchars=tab:›\ ,trail:•,extends:…,nbsp:.

" =====================
" Formatting / 格式设置
" =====================
set nowrap                          " Do not wrap long lines / 关闭自动换行
set autoindent                      " Indent at the same level of the previous line / 缩进与前一行相同
set shiftwidth=4                  " Use indents of 4 spaces / 使用4个空格代替缩进
set expandtab                       " Tabs are spaces, not tabs / 制表符使用空格代替, 而不是制表符本身
set tabstop=4                     " An indentation evry four columns / 每四列为一个缩进
set softtabstop=4                 " Let backspace delete indent / 退格键可删除制表符
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join / 使用连接命令时, 避免插入空格
set splitright                      " Puts new vsplit windows to the right of the current / 左右分割窗口时, 优先在右边
set splitbelow                      " Puts new split windows to the bottom of the current / 上下分割窗口时, 优先在下边
set pastetoggle=<F12>             " PasteToggle key is F12 / 切换粘贴模式的按键为F12

" Remove trailing whitespaces and ^M chars
" 文件保存时, 去除每行后的空格和^M标志
au FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql 
    \ au BufWritePre <buffer> call StripTrailingWhitespace()

" ===================
" Key mappings / 按键
" ===================
let mapleader = '<Space>'

nmap <m-j> <C-w>j
nmap <m-k> <C-w>k
nmap <m-l> <C-w>l
nmap <m-h> <C-w>h

nnoremap <Tab> gt
nnoremap <S-Tab> gT

noremap j gj
noremap k gk

nnoremap Y y$

map Q gq

" ================
" Functions / 函数
" ================
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

