# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="example"
ZSH_THEME="shadowstar"
#ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias la="ls -a"
alias ll="ls -l"
alias ls="ls -G -F"
alias lh="ls -lh"
alias grep="grep --colour=auto"

alias pkginfo="pkgutil -v --pkg-info"
alias pkgf="pkgutil -v --files"
alias pkgfinfo="pkgutil -v --file-info"
alias pkgs="pkgutil -v --pkgs"

export PAGER=/opt/bin/vimpager
export PATH=$PATH:/opt/bin:/opt/toolchain/bin:/opt/toolchain/sbin
export GNUPATH=/opt/gnu/bin
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
export TERM=xterm-color

#setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_LIST
setopt AUTO_MENU
setopt LIST_AMBIGUOUS
setopt MENU_COMPLETE

#export LSCOLORS=Exfxcxdxbxegedabagacad
unset LSCOLORS
unsetopt AUTO_CD
unsetopt COMPLETE_IN_WORD

