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

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(make git svn mercurial)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias lh="ls -lh"
alias grep="grep --color=auto"

if [[ "`uname -s`" = "Darwin" ]]; then
	export PATH=$PATH:/opt/bin:/opt/oct-tools/bin:/opt/x86-tools/bin
	export GNUPATH=/opt/gnu/bin
	alias pkginfo="pkgutil -v --pkg-info"
	alias pkgf="pkgutil -v --files"
	alias pkgfinfo="pkgutil -v --file-info"
	alias pkgs="pkgutil -v --pkgs"
	alias ls="ls -G -F"
elif [[ "`uname -s`" = "Linux" ]]; then
	which gsed >/dev/null 2>&1 || which gnused >/dev/null 2>&1 && alias gsed="gnused" || alias gsed="sed"
	which gawk >/dev/null 2>&1 || which gnuawk >/dev/null 2>&1 && alias gawk="gnuawk" || alias gawk="awk"
	which exuberant-ctags >/dev/null 2>&1 || which ctags-exuberant >/dev/null 2>&1 && alias exuberant-ctags="ctags-exuberant" || alias exuberant-ctags="ctags"
	alias ls="ls --color=auto -F"
fi

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
#export TERM=xterm-color

if $(which vimpager >/dev/null 2>&1); then
	export PAGER="$(which vimpager)"
fi

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt AUTO_LIST
setopt AUTO_MENU
setopt LIST_AMBIGUOUS
setopt MENU_COMPLETE
setopt BASH_AUTO_LIST

#export LSCOLORS=Exfxcxdxbxegedabagacad
unset LSCOLORS
unsetopt AUTO_CD
unsetopt COMPLETE_IN_WORD
unsetopt CORRECT_ALL
unsetopt SHARE_HISTORY

