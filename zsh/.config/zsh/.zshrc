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

# Plugins
plug "romkatv/powerlevel10k"
plug "$HOME/.local/scripts/vim-zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "$HOME/.asdf/asdf.sh"
plug "$HOMW/.fzf.zsh"
plug "$HOME/.config/zsh/.p10k.zsh"

# Keybinds
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^e "lf\n"
