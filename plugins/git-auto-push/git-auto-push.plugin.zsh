# Default auto-push interval: 60 seconds
: ${GIT_AUTO_PUSH_INTERVAL:=60}
: ${GIT_AUTO_PUSH_REMOTE:=backup}

# Necessary for the git-push-all function
zmodload zsh/datetime zsh/stat

function git-push-all {
  (
    # Get git root directory
    if ! gitdir="$(command git rev-parse --git-dir 2>/dev/null)"; then
      return 0
    fi

    # Do nothing if auto-push is disabled or don't have permissions
    if [[ ! -w "$gitdir" || -f "$gitdir/NO_AUTO_PUSH" ]] ||
       [[ -f "$gitdir/PUSH_LOG" && ! -w "$gitdir/PUSH_LOG" ]]; then
      return 0
    fi

    if ! $(command git remote 2>/dev/null | grep -q "\<$GIT_AUTO_PUSH_REMOTE\>"); then
      return 0
    fi

    # Get time (seconds) when auto-push was last run
    lastrun="$(zstat +mtime "$gitdir/PUSH_LOG" 2>/dev/null || echo 0)"
    # Do nothing if not enough time has passed since last auto-push
    if (( EPOCHSECONDS - lastrun < $GIT_AUTO_PUSH_INTERVAL )); then
      return 0
    fi

    # Push backup remote (avoid ssh passphrase prompt)
    date -R &>! "$gitdir/PUSH_LOG"
    GIT_SSH_COMMAND="command ssh -o BatchMode=yes" \
      command git push --all --force $GIT_AUTO_PUSH_REMOTE 2>/dev/null &>> "$gitdir/PUSH_LOG"
  ) &|
}

function git-auto-push {
  # Do nothing if not in a git repository
  command git rev-parse --is-inside-work-tree &>/dev/null || return 0

  if ! $(command git remote 2>/dev/null | grep -q "\<$GIT_AUTO_PUSH_REMOTE\>"); then
    command echo "${fg_bold[red]}Remote NOT found${reset_color}" && return 0
  fi

  # Remove or create guard file depending on its existence
  local guard="$(command git rev-parse --git-dir)/NO_AUTO_PUSH"
  if [[ -f "$guard" ]]; then
    command rm "$guard" && echo "${fg_bold[green]}enabled${reset_color}"
  else
    command touch "$guard" && echo "${fg_bold[red]}disabled${reset_color}"
  fi
}

# zle-line-init widget (don't redefine if already defined)
(( ! ${+functions[_git-auto-push-line-init]} )) || return 0

case "$widgets[zle-line-init]" in
  # Simply define the function if zle-line-init doesn't yet exist
  builtin|"") function _git-auto-push-line-init() {
      git-push-all
    } ;;
  # Override the current zle-line-init widget, calling the old one
  user:*) zle -N _git-auto-push-line-init "${widgets[zle-line-init]#user:}"
    function _git-auto-push-line-init() {
      git-push-all
      zle _git-auto-push-line-init -- "$@"
    } ;;
esac

zle -N zle-line-init _git-auto-push-line-init
