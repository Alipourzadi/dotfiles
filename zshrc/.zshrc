export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
plugins=(git nvm zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
eval "$(starship init zsh)"

# bun completions
[ -s "/home/excalibur/.bun/_bun" ] && source "/home/excalibur/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export EDITOR="nvim"

# true color for tmux
export TERM=xterm-256color;
export https_proxy=http://localhost:12334
export http_proxy=http://localhost:12334


# aliases 


## batcat

alias bat='batcat'

## network aliases
alias nmls='nmcli device wifi list'
alias nmc='nmcli device wifi connect'
alias nmd='nmcli device disconnect'

## lsd alias
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

## tmuxifier
alias agroPanel='tmuxifier load-session agroPanel'
alias agroWeb='tmuxifier load-session agroWeb'

## power managment
alias cpuGetAvail='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors'
alias cpuShowCurrent='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpuSetHigh='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpuSetLow='echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'


export PATH=$PATH:/usr/local/go/bin

source /home/excalibur/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

