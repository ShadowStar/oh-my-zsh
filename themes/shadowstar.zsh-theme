# ShadowStar's theme

local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

ZSH_THEME_GIT_PREFIX=" ${yellow}±|"
ZSH_THEME_GIT_SUFFIX="${yellow}|"
ZSH_THEME_GIT_PROMPT_PREFIX="${magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ${red}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${green}✓"

ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="${green}="
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="${green}+"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="${yellow}-"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${red}≠"

ZSH_THEME_LAST_CMD_FAILED="${red}✗"
ZSH_THEME_LAST_CMD_SUCCESS="${green}✓"

ZSH_THEME_IN_VIM_SHELL="(vim)"
ZSH_THEME_IN_DOCKER="${yellow}[${blue}D${yellow}]"

function git_info() {
	local git_info="$(git_prompt_info)"
	if [[ -n $git_info ]]; then
		git_info=$ZSH_THEME_GIT_PREFIX$git_info
		git_info+="$(git_remote_status)"$ZSH_THEME_GIT_SUFFIX
	fi
	echo -n "$git_info"
}

PROMPT='$(last_cmd_info)$(docker_info)$(in_vim_shell)${yellow}|${cyan}$(user_info)${green}$(remote_info)${blue}%c$(git_info) ${cyan}%#${reset} '
