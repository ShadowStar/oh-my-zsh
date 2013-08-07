PROMPT='%{$fg[cyan]%}$(user_info)%{$fg_bold[green]%}$(remote_info)%{$fg_bold[blue]%}%c$(git_prompt_info)%{$fg_bold[cyan]%} %# %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$fg_bold[yellow]%}±|%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$fg_bold[yellow]%}|"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔%{$fg_bold[yellow]%}|"

ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg_bold[red]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg_bold[red]%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[green]%}✭"

