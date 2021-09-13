# vim: foldmethod=marker:foldmarker=#region,#endregion

#region zsh-newusir-install
# Lines configured by zsh-newuser-install
HISTFILE=$XDG_CACHE_HOME/zsh/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd nomatch notify
setopt HIST_IGNORE_SPACE
setopt correct
setopt histignoredups
setopt histignorespace
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/pedro/.zshrc'
#autoload -Uz compinit
#compinit
# End of lines added by compinstall
#endregion

#region Options
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CONTINUE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HUP
#endregion

#region Bind keys
bindkey "^[[1;5D" emacs-backward-word
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey `tput kdch1` delete-char
bindkey '^R' history-incremental-search-backward
#endregion

#region Variables
export EDITOR=nvim
export VISUAL=nvim
export GPG_TTY=$(tty) 
export WINEPREFIX="$XDG_DATA_HOME/wine-pfx"
#endregion

#region Aliases
alias ls='ls --color=auto'
alias l='ls -lah --color=auto'
alias icat='kitty icat'
#endregion

#region Antigen stuff
#ADOTDIR="$HOME/.local/share/antigen"
#source "$ADOTDIR/antigen.zsh"
# Load the oh-my-zsh's library.
#antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found
# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
#antigen theme powerlevel9k/powerlevel9k
# Tell Antigen that you're done.
#antigen apply
#endregion

#region Programs

# Rustup
fpath+=$ZDOTDIR/.zfunc

# Kitty autocomplete
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# FZF defaults & goto
FZF_DEFAULTS_OPTS='--preview-window=:40%:wrap'
source ~/Projects/sh-functions/goto.sh

ZSH_THEME="$ZDOTDIR/.zsh-theme"
source $ZSH_THEME

source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source ~/Projects/sh-functions/setup-env.sh

eval $(ssh-agent);

#endregion

