if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi
# dont save history 
export HISTFILE=/dev/null
# git alias 
alias gs='git status'
alias ga='git add'
alias gcmit='git commit'
alias glg='git log --oneline --graph --all'
alias gb='git branch'
alias gco='git checkout'
alias gpl='git pull'
alias gpus='git push'
# normal alias
alias cls='clear'
alias path='echo $PATH | tr ":" "\n"'
alias ip='ipconfig'
alias his='history'
alias ll='ls -la'
alias la='ls -A'
alias st='cd /d/MySelfFile/05_INFO-stm32/RTOS-INFO/00_my_information/02_st'
# star ship 
eval "$(starship init bash)"