# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
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

# aliases 

## network aliases
alias wls='nmcli device wifi list'
alias wc='nmcli device wifi connect'
alias wd='nmcli device disconnect wlan0'

## tmuxifier
alias agroPanel='tmuxifier load-session agroPanel'
alias agroWeb='tmuxifier load-session agroWeb'
export PATH=$PATH:/usr/local/go/bin

