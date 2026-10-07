#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias vim='nvim'
alias ls='lsd'
alias c='clear'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias allp='systemctl list-units --type=service --state=running'
alias zenhole='ssh zen@zenraspi'
alias fullupdate='sudo pacman -Sy archlinux-keyring && sudo pacman -Su'

PS1='[\u@\h \W]\$ '

LS_COLORS='di=0;36:fi=0;32:*.jpg=0;35:*.png=0;35'
export LS_COLORS

# open neofetch on first terminal
LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l)
if [ $LIVE_COUNTER -eq 1 ]; then
  fastfetch
fi

export DRIFT_TIMEOUT=300
eval "$(drift shell-init bash)"

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519 # Add your key automatically
fi

# add jdk 25 to path and set java_home

export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export PATH=$JAVA_HOME/bin:$PATH
