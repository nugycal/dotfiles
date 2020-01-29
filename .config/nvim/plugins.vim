if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('jaredgorski/SpaceCamp')
    call dein#add('itchyny/lightline.vim')
    call dein#add('majutsushi/tagbar')
    call dein#add('nathanaelkane/vim-indent-guides')
    cal dein#add('raimondi/delimitmate')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('RRethy/vim-hexokinase')

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('w0rp/ale')
    " call dein#add('brooth/far.vim')
    " call dein#add('Shougo/echodoc.vim')
    call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})
    call dein#add('1995eaton/vim-better-javascript-completion')
    call dein#add('othree/html5.vim')
    call dein#add('Raimondi/delimitMate')
    call dein#add('valloric/MatchTagAlways', {'on_ft': ['html', 'xml', 'jsx']})
    call dein#add('neomake/neomake')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
    call dein#add('wsdjeg/dein-ui.vim')
    " call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
    " call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('romainl/vim-devdocs')
    " call dein#add('sakhnik/nvim-gdb')
    call dein#add('rhysd/git-messenger.vim', {
                \   'lazy' : 1,
                \   'on_cmd' : 'GitMessenger',
                \   'on_map' : '<Plug>(git-messenger',
                \ })
    call dein#add('chrisjohnson/vim-foldfunctions')
    call dein#add('tmhedberg/SimpylFold')
    call dein#add('Shougo/denite.nvim')
    call dein#add('chemzqm/denite-git')
    call dein#add('neoclide/vim-easygit')
    " call dein#add('Shougo/defx.nvim')
    " call dein#add('kristijanhusak/defx-icons')
    " call dein#add('wsdjeg/vim-todo')
    call dein#add('dyng/ctrlsf.vim')
    call dein#add('AndrewRadev/tagalong.vim')
    " call dein#add('liuchengxu/vista.vim') " Tagbar Alternative which works asynchronously and uses LSP
    call dein#add('dunstontc/vim-vscode-theme')
    call dein#add('junegunn/fzf') " Fuzzy finder stuff
    call dein#add('junegunn/fzf.vim') " Fuzzy finder stuff

    call dein#add('tpope/vim-vinegar') " Make NetRW better
    call dein#add('TaDaa/vimade')  " dim inactive panes
    call dein#add('liuchengxu/vim-clap') " Finder and dispatcher
    call dein#add('joeytwiddle/sexy_scroller.vim')
    call dein#add('voldikss/vim-floaterm') " Terminal
    call dein#add('Yggdroot/LeaderF') " Efficient fuzzy finder
    
    "call dein#add('autozimu/LanguageClient-neovim', {
    "    \ 'rev': 'next',
    "    \ 'build': 'bash install.sh',
    "\ }) " Hooks into LSP to provide some IDE features

    call dein#end()
    call dein#save_state()
endif

colorscheme SpaceCamp

" imap <C-g> :Vista!! <CR>
" nmap <C-g> :Vista!! <CR>
"
imap <C-g> :TagbarToggle <CR>
nmap <C-g> :TagbarToggle <CR>

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let g:easygit_enable_command = 1
:

let g:indent_guides_enable_on_vim_startup = 1

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
" CoC config
set hidden "if hidden is not set, TextEdit might fail.
" mapping to jump to tag under cursor

nmap <silent> gr #<Plug>(coc-references)
nnoremap <silent> gd <C-]>
nmap <silent> <C-]> :silent! TagImposterAnticipateJump<CR><Plug>(coc-definition)

nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-rename)
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>cx  <Plug>(coc-fix-current)
" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>cl :<C-u>CocList<CR>
nnoremap <silent> <leader>cp :<C-u>CocListResume<CR>
nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<CR>
nnoremap <silent> <leader>cj :<C-u>CocNext<CR>
nnoremap <silent> <leader>ck :<C-u>CocPrev<CR>
nnoremap <silent> <leader>co :<C-u>CocList outline<CR>
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<CR>
nnoremap <leader>c?  :nmap <leader>c<CR>
nnoremap <leader>cc :CocCommand<CR>

" Use `[C` and `]C` to navigate diagnostics
nmap <silent> [C <Plug>(coc-diagnostic-prev)
nmap <silent> ]C <Plug>(coc-diagnostic-next)

command! -nargs=0 CFormat :call CocAction('format')
command! -nargs=? CFold :call CocAction('fold', <f-args>)

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:Hexokinase_highlighters = ['sign_column']
let g:Hexokinase_signIcon = '■'
nmap <C-h> :HexokinaseToggle <CR>
imap <C-h> :HexokinaseToggle <CR>

let g:Hexokinase_v2 = 0 " Disable hex v2 (I don't want to have to run `make hexokinase` each time there's an update)

filetype plugin indent on
syntax enable

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

" Floating Terminal
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'
