#!zsh

(($+functions[__git_command_successful])) ||
__git_command_successful () {
	if (( ${#*:#0} > 0 )); then
		_message 'not a git repository'
		return 1
	fi
	return 0
}

(( $+functions[__git_all_branches] )) ||
__git_all_branches () {
	local expl
	local git_dir
	local dir=$words[2]
	declare -a all_branch_names

	if [ "$dir" == "*.git" ]; then
		git_dir=${dir}
	else
		git_dir=${dir}/.git
	fi
	all_branch_names=(${${${${${(f)"$(_call_program all_branches git --git-dir=$git_dir for-each-ref --format='"%(refname)"' 2>/dev/null)"}#refs/}#heads/}#remotes/}#tags/})
	__git_command_successful $pipestatus || return 1
	_wanted all-branch-names expl all-branch compadd "$@" -a - all_branch_names
}

_git-branch-date () {
	_arguments -C \
		'-h[show usage]' \
		'(-a --all)'{-a,--all}'[show all refs]' \
		'(-t --tag)'{-t,--tag,--tags}'[show tags instead of branches]' \
}

_git-new-workdir () {
	_arguments -C \
		'1: :_directories' \
		'2: :_directories' \
		'-h[show usage]' \
		'(-o --orphan)'{-o,--orphan}'[create new orphan branch]:name' \
		':: :__git_all_branches'
}

_git-update-dir () {
	_arguments -C \
		':: :_directories'
}

_git-vergen () {
	_arguments -C \
		'-h[show usage]' \
		'(-r --release)'{-r,--release}'[add release tag, like beta, etc]: :(-alpha -beta -rc -release)' \
		'(-f --full)'{-f,--full}'[show full message]' \
		'(-n --now)'{-n,--now}'[use current user & time instead of commit'\''s]' \
		'(-d --dir)'{-d,--dir}'[specify work tree instead of \$(pwd)]: :_directories'
}

zstyle ':completion:*:*:git:*' user-commands \
	branch-date:'show branches latest commit time in reverse order' \
	new-workdir:'create new work tree with the same .git repository' \
	update-dir:'update remotes and prune local' \
	vergen:'generate version by tag'
