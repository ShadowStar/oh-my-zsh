# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="example"
ZSH_THEME="shadowstar"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

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

DISABLE_USER_INFO="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# DISABLE_SUBMODULE_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew docker docker-machine osx make git svn mercurial colored-man-pages zsh_reload z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt AUTO_LIST
setopt AUTO_MENU
setopt LIST_AMBIGUOUS
setopt MENU_COMPLETE
setopt BASH_AUTO_LIST
setopt NO_NOMATCH

#export LSCOLORS=Exfxcxdxbxegedabagacad
unset LSCOLORS
unsetopt AUTO_CD
unsetopt COMPLETE_IN_WORD
unsetopt CORRECT_ALL
unsetopt SHARE_HISTORY

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
#export TERM=xterm-color

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias lh="ls -lh"
alias grep="grep --exclude 'tags' --exclude 'cscope.*' --binary-files=without-match --color=auto"

export CTPATH=$(echo /opt/*-tools/bin 2>/dev/null | tr ' ' ':')

if [[ "`uname -s`" = "Darwin" ]]; then
	PATH=$PATH:/opt/bin:/opt/my_scripts
	if [[ -n ${CTPATH} ]]; then
		PATH=$PATH:$CTPATH
	fi
	GNUPATH=$(echo /usr/local/opt/*/libexec/gnubin | tr ' ' ':')
	if [[ -x $(which brew) ]]; then
		if [[ -n $(brew list gnu-getopt) ]]; then
			GNUPATH=$GNUPATH:$(brew --prefix gnu-getopt)/bin
		fi
		if [[ -n $(brew list gettext) ]]; then
			GNUPATH=$GNUPATH:$(brew --prefix gettext)/bin
		fi
		if [[ -n $(brew list polipo) ]]; then
			alias hp='http_proxy=http://localhost:8123'
		fi
	fi
	if [[ -x $(which boot2docker) ]]; then
		eval $(boot2docker shellinit 2>/dev/null)
	fi
	export PATH
	export GNUPATH
	alias pkginfo="pkgutil -v --pkg-info"
	alias pkgf="pkgutil -v --files"
	alias pkgfinfo="pkgutil -v --file-info"
	alias pkgs="pkgutil --pkgs"
	alias pkgl="pkgutil --pkgs | grep -v \"^com\.apple\""
	alias ls="ls -G -F"
	alias GetBTMMAddr="echo show Setup:/Network/BackToMyMac | scutil | sed -n 's/.* : *\(.*\).$/\1/p'"
elif [[ "`uname -s`" = "Linux" ]]; then
	alias ls="ls --color=auto -F"
fi

if $(which vimpager >/dev/null 2>&1); then
	export PAGER="$(which vimpager)"
fi

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

