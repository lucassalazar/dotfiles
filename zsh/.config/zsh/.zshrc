# Runs neofetch in every terminal open 
neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History setup in cache directory
HISTSIZE=9999
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/.zsh_history

# Aliases
[ -f "${XDG_CONFIG_HOME}/shell/aliases" ] && source "${XDG_CONFIG_HOME}/shell/aliases"

bindkey -s ^f "tmux-sessionizer\n"

source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.config/zsh/powerlevel10k/powerlevel9k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
