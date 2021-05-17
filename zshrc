# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="example"
ZSH_THEME="shadowstar"
#ZSH_THEME="powerlevel10k/powerlevel10k"
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
plugins=(brew docker docker-machine osx make git git-auto-fetch git-shadowstar svn mercurial colored-man-pages themes web-search zsh_reload z zsh-prompt-benchmark fzf)

if [ -z $OSTYPE ]; then
	export OSTYPE=$(uname | tr [[:upper:]] [[:lower:]])
fi

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

if $(locale -a 2>/dev/null | grep -q zh_CN.UTF-8); then
	export LANG="zh_CN.UTF-8"
	export LC_ALL="zh_CN.UTF-8"
elif $(locale -a 2>/dev/null | grep -q en_US.UTF-8); then
	export LANG="en_US.UTF-8"
	export LC_ALL="en_US.UTF-8"
else
	export LANG="POSIX"
	export LC_ALL="POSIX"
fi

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias lh="ls -lh"
alias grep="grep -n --exclude 'tags' --exclude 'cscope.*' --binary-files=without-match --color=auto"

export CTPATH=$(echo /opt/*-tools/bin 2>/dev/null | tr ' ' ':')

if [[ $OSTYPE =~ "darwin" ]]; then
	PATH=$PATH:/opt/bin:/opt/my_scripts
	if [[ -n ${CTPATH} ]]; then
		PATH=$PATH:$CTPATH
	fi
	GNUPATH=$(echo /usr/local/opt/*/libexec/gnubin | tr ' ' ':')
	if command -v brew >/dev/null; then
		local bpath
		bpath=$(brew --prefix gnu-getopt)
		if [[ -d "${bpath}" ]]; then
			GNUPATH=$GNUPATH:"${bpath}"/bin
		fi
		bpath=$(brew --prefix gettext)
		if [[ -d "${bpath}" ]]; then
			GNUPATH=$GNUPATH:"${bpath}"/bin
		fi
		bpath=$(brew --prefix bison)
		if [[ -d "${bpath}" ]]; then
			GNUPATH=$GNUPATH:"${bpath}"/bin
		fi
		bpath=$(brew --prefix powerlevel10k)
		if [[ -d "${bpath}" && $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
			source "${bpath}"/powerlevel10k.zsh-theme
		fi
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
elif [[ $OSTYPE =~ "linux" ]]; then
	alias ls="ls --color=auto -F"
fi

if command -v vimpager >/dev/null; then
	export PAGER="vimpager"
fi

if command -v vim >/dev/null; then
	alias vi="vim -O"
fi

if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
