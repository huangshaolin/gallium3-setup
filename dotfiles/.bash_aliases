alias l="ls --color=auto"
alias ll="ls -alh"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# Fix touchpad freezing
alias fix-touch='sudo modprobe -r atmel_mxt_ts && sudo modprobe atmel_mxt_ts; sleep 2; source ~/.mike_xinitrc'

