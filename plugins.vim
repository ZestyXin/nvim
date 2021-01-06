" Path
let s:plug_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Plugins
call plug#begin(s:plug_path.'/plugged')
    " statusline
        Plug 'itchyny/lightline.vim'
    " Complete
        Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
        Plug 'Shougo/deoplete-clangx'
        Plug 'Shougo/neco-vim'
        Plug 'Shougo/neoinclude.vim'
        Plug 'Shougo/neopairs.vim'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'Shougo/echodoc.vim'
        Plug 'jiangmiao/auto-pairs'
    " Explorer
        Plug 'justinmk/vim-dirvish'
        Plug 'kristijanhusak/vim-dirvish-git'
    " Ctags
        Plug 'ludovicchabant/vim-gutentags'
    " Lint
        Plug 'neomake/neomake'
    " Function / MRU
        Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}
    " Other
        "Plug 'airblade/vim-rooter'
        Plug 'tpope/vim-unimpaired'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-indent'
        Plug 'kana/vim-textobj-syntax'
        Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
        Plug 'sgur/vim-textobj-parameter'
call plug#end()

" Load Settings
let s:plug_settings_list = globpath(s:plug_path.'/plugins', '*.vim', 0, 1)
let s:plug_list_size = len(s:plug_settings_list)
let s:plug_list_count = 0

while s:plug_list_count < s:plug_list_size
    if (filereadable(expand(s:plug_settings_list[s:plug_list_count])))
        exec expand('source '.s:plug_settings_list[s:plug_list_count])
    endif
    let s:plug_list_count = s:plug_list_count + 1
endwhile

