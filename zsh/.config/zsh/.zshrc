neofetch

# Loads lightweight plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Enable colors
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd       # Automatically cd into typed directory
setopt interactivecomments

# History setup in cache directory
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zsh_history"

# Load aliases 
plug "${XDG_CONFIG_HOME:-$HOME/.config/}/shell/aliases"

# Basic auto/tab completion
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files

# Vim keys
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Plugins
plug "romkatv/powerlevel10k"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "$XDG_CONFIG_HOME/nvm/nvm.sh"
# plug "$HOME/.asdf/asdf.sh"
plug "$HOME/.fzf.zsh"
plug "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

# Keybinds
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^h "tmux-cht\n"
bindkey -s ^e "lf\n"
