# ShadowStar's theme

local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

PROMPT='$(last_cmd_info)${cyan}$(user_info)${green}$(remote_info)${blue}%c$(git_prompt_info)$(git_remote_status)${cyan} %# ${reset}'

ZSH_THEME_GIT_PROMPT_PREFIX=" ${reset}${yellow}±|${magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${red}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${green}✔"

# ZSH_THEME_GIT_PROMPT_ADDED=" ${green}+"
# ZSH_THEME_GIT_PROMPT_MODIFIED=" ${red}*"
# ZSH_THEME_GIT_PROMPT_DELETED=" ${red}-"
# ZSH_THEME_GIT_PROMPT_RENAMED=" ${red}➜"
# ZSH_THEME_GIT_PROMPT_UNMERGED=" ${red}="
# ZSH_THEME_GIT_PROMPT_UNTRACKED=" ${yellow}✕"

ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="${green}=${yellow}|"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="${green}+${yellow}|"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="${yellow}-${yellow}|"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${red}≠${yellow}|"

ZSH_THEME_LAST_CMD_FAILED="${red}✗${yellow}|"
ZSH_THEME_LAST_CMD_SUCCESS="${green}✔${yellow}|"
