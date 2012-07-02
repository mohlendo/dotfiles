#git bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

#git stuff
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

#git ps1 extension
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# android tools to path
PATH=$PATH\:/Library/android-sdk-macosx/tools\:/Library/android-sdk-macosx/platform-tools

# some more ls aliases
alias ls="ls -G" #color ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#for dotfiles management
alias dotfiles='git --git-dir=/Users/moh/.dotfiles.git --work-tree=/Users/moh' 
