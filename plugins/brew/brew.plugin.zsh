alias brewp='brew pin'
alias brewsp='brew list --pinned'
alias bubo='brew update && brew outdated --greedy'
alias bubc='brew upgrade --greedy && brew cleanup'
alias bubu='bubo && bubc'
alias buf='brew upgrade --formula'
alias bcubo='brew update && brew outdated --cask'
alias bcubc='brew upgrade --cask && brew cleanup'
alias brewl='brew leaves | sort'
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600

function brews() {
  local formulae="$(brew leaves | xargs brew deps --installed --for-each)"
  local casks="$(brew list --cask)"

  local blue="$(tput setaf 4)"
  local bold="$(tput bold)"
  local off="$(tput sgr0)"

  echo "${blue}==>${off} ${bold}Formulae${off}"
  echo "${formulae}" | sed "s/^\(.*\):\(.*\)$/\1${blue}\2${off}/"
  echo "\n${blue}==>${off} ${bold}Casks${off}\n${casks}"
}
