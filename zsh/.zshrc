ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
    asdf
)

source $ZSH/oh-my-zsh.sh

# History setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=9999
setopt HIST_EXPIRE_DUPS_FIRST

# aliases
[ -f "${XDG_CONFIG_HOME}/shell/aliases" ] && source "${XDG_CONFIG_HOME}/shell/aliases"

bindkey -s ^f "tmux-sessionizer\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

neofetch
