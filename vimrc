:let mapleader = ","

 set nocompatible              " be iMproved, required
 filetype off                  " required

 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 " call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 Bundle 'kchmck/vim-coffee-script'
 Bundle "pangloss/vim-javascript"
 Bundle 'kien/ctrlp.vim'
 Bundle 'ervandew/supertab'
 Bundle 'tpope/vim-surround'
 Bundle 'mileszs/ack.vim'
 Bundle 'juvenn/mustache.vim'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'scrooloose/syntastic'
 Bundle 'jeffkreeftmeijer/vim-numbertoggle'
 Bundle 'elzr/vim-json'
 Bundle 'Shougo/vimfiler.vim'
 Bundle 'Shougo/unite.vim'
 Bundle 'thoughtbot/vim-rspec'
 Bundle 'rking/ag.vim'
 Bundle 'vim-scripts/BufOnly.vim'
 Bundle 'christoomey/vim-tmux-navigator'
 Bundle 'benmills/vimux'
 Bundle 'mxw/vim-jsx'

 " Themes
 Bundle 'zefei/cake16'
 Bundle 'vim-scripts/desertEx'
 Bundle 'chriskempson/vim-tomorrow-theme'
 Bundle 'therubymug/vim-pyte'
 Bundle 'marlun/vim-starwars'
 Bundle 'altercation/vim-colors-solarized'

 call vundle#end()            " required
 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FMQ
 " NOTE: comments after Bundle command are not Mllowed..


 " Colors, syntax, etc.
 " colorscheme solarized
 set number
 syntax enable
 set background=dark
 let g:solarized_termcolors = 256
 colorscheme solarized

 " set background=dark
 set number
 set ruler

 " Whitespace, tabs, etc
 set expandtab
 set shiftwidth=2
 set softtabstop=2
 set tabstop=2
 set wrap

 " Search
 set incsearch
 set ignorecase
 set smartcase

 " Status bar
 set laststatus=2
function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,hbs} call s:setupMarkup()
au BufRead,BufNewFile *.{hbs,twig} set ft=html

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

au BufNewFile,BufRead *.php set filetype=php

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
" filetype plugin indent on

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Ignore directories / files that we don't want to search for
set wildignore+=*/tmp/*,*/.bower-cache/*,*/build/*,*/coverage/*,*.so,*.swp,*.zip

" Add a newline from current cursor placement without entering insert mode

map <S-Enter> i<CR><Esc>

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Remove whitespace at the end of lines.
autocmd BufWritePre * :%s/\s\+$//e

" Two semicolons are easy to type.
imap ;; <Esc>

" VimFiler
let g:vimfiler_as_default_explorer = 1
map <Leader>f :VimFiler<CR>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}")'

" Split navigation / configuration.
" To navigate splits.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" To move splits.
nnoremap ∆ <C-W><S-J>
nnoremap ˚ <C-W><S-K>
nnoremap ¬ <C-W><S-L>
nnoremap ˙ <C-W><S-H>

" Global resize.
nnoremap <Leader>= <C-W>=

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|log)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
 \}

 " Use the nearest .git directory as the cwd
 " This makes a lot of sense if you are working on a project that is in
 " version control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" :BufOnly
nmap <leader>bo :BufOnly<cr>

" vim-jsx
let g:jsx_ext_required = 0
