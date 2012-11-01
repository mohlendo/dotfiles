" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" set t_Co=256

syntax enable
set background=dark
set guifont=Bitstream\ Vera\ Sans\ Mono:h12
colorscheme solarized
" colorscheme molokai
" let g:molokai_original = 1

let mapleader=","

let g:nerdtree_tabs_open_on_gui_startup=0 "no nerdtree on startup
map <F2> <plug>NERDTreeTabsToggle<CR>

map <F3> :FufBuffer<CR>
map <F4> :bp<CR>
map <F5> :bn<CR>

" omnicompletion on strg space
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set tabstop=2
set shiftwidth=2
set expandtab

"backup to a central directory
set backupdir=/tmp/,$TEMP,$TMP,.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
  " Stuff for auto indent and different filetypes
  augroup vimrc 
  au! 
  autocmd FileType ant setlocal sw=2 sts=2 et 
  autocmd FileType xml setlocal sw=2 sts=2 et 
  autocmd FileType python setlocal sw=4 sts=4 et tw=72 
  autocmd FileType rst setlocal sw=4 sts=4 et 
  autocmd FileType ruby setlocal sw=2 sts=2 et tw=72 
  autocmd FileType cucumber setlocal sw=2 sts=2 et  
  autocmd FileType java setlocal sw=2 sts=2 et  
  autocmd FileType javascript setlocal sw=4 sts=4 et  
  autocmd FileType jade  setlocal sw=4 sts=4 et  
  autocmd FileType htmldjango setlocal sw=4 sts=4 et  
  autocmd FileType jsp setlocal sw=2 sts=2 et  
  autocmd FileType html setlocal sw=2 sts=2 et  
  autocmd FileType xhtml setlocal sw=2 sts=2 et  
  augroup END 
  
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
