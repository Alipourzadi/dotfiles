export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export EDITOR="nvim"
export TERM=xterm-256color;
export PATH=$PATH:/usr/local/go/bin
export SWAY_SCREENSHOT_DIR="~/Downloads"

plugins=(git volta)
source $ZSH/oh-my-zsh.sh

eval "$(tmuxifier init -)"
eval "$(starship init zsh)"

# bun completions
[ -s "/home/excalibur/.bun/_bun" ] && source "/home/excalibur/.bun/_bun"

## batcat
alias bat='batcat'

## network aliases
alias nmls='nmcli device wifi list'
alias nmc='nmcli device wifi connect'
alias nmd='nmcli device disconnect'

## lsd alias
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

## tmuxifier
alias agroPanel='tmuxifier load-session agroPanel'
alias agroWeb='tmuxifier load-session agroWeb'

alias darkTheme='gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-dark'

alias lightTheme='gsettings set org.gnome.desktop.interface gtk-theme Adwaita \
&& gsettings set org.gnome.desktop.interface color-scheme prefer-light'

## power managment
alias cpuGetAvail='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors'
alias cpuShowCurrent='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpuSetHigh='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpuSetLow='echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

source /home/excalibur/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
