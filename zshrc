# Config directory
CONF_DIR="$HOME/.config/zsh"

[ -f "$CONF_DIR/gpg-agent.zsh" ] && source "$CONF_DIR/gpg-agent.zsh"

# Tweak path
export PATH="$HOME/dotfiles/bin:$HOME/.local/bin":$PATH

autoload -U colors && colors
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/struchu/.zshrc'

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload -i zsh/complist
compinit

autoload -Uz promptinit
promptinit

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

# End of lines added by compinstall
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Vi keys in menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Load zplug plugins
source "$HOME/dotfiles/src/zplug/init.zsh"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "joel-porquet/zsh-dircolors-solarized", use:zsh-dircolors-solarized.zsh

zplug load

# Load theme
[ -f "$CONF_DIR/theme.zsh" ] && source "$CONF_DIR/theme.zsh"

# Edit command line
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Set default user permissions
umask 0022

# Load aliases
[ -f "$CONF_DIR/aliases" ] && source "$CONF_DIR/aliases"
[ -f "$CONF_DIR/gcalcli.zsh" ] && source "$CONF_DIR/gcalcli.zsh"

# Tools
export EDITOR=vim
export REVIEW_BASE=develop

# Pfetch settings
export PF_ASCII="void"
export PF_COL1=4
export PF_COL2=15
export PF_COL3=2

# Lynx settings
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"

# Autosuggestions
bindkey '^f' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=14"
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

# Autojump

source /usr/share/autojump/autojump.zsh

# Autocomplete for JIRA

eval "$(jira --completion-script-zsh)"
