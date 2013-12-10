export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# export NODE_PATH=/usr/local/lib/node_modules
# export PATH=$PATH:/usr/local/mysql/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias vim='/Applications/MacVim.App/Contents/MacOS/Vim'

function track_git_branches {
  for remote in $(git branch -r | grep -v master); do
    $(git checkout --track $remote)
  done
}

GIT_PS1_SHOWUPSTREAM='auto'
GIT_PS1_SHOWUNTRACKEDFILES='.'
GIT_PS1_SHOWSTASHSTATE='.'
GIT_PS1_SHOWDIRTYSTATE='.'
GIT_PS1_SHOWCOLORHINTS='.'

function prompt_command {
  local GREY='\[\e[1;30m\]'
  local RED='\[\e[0;31m\]'
  local GREEN='\[\e[0;32m\]'
  local YELLOW='\[\e[0;33m\]'
  local BLUE='\[\e[0;34m\]'
  local CYAN='\[\e[0;36m\]'
  local WHITE='\[\e[0m\]'

  local PS1_DEVIDER="${RED} | "
  local PS1_TIME="${GREY}\@"
  local PS1_PWD="${PS1_DEVIDER}${CYAN}\w"
  local PS1_NEW="${GREY}\n➜  ${WHITE}"

  local PS1_GIT=
  local GIT_BRANCH="$(__git_ps1 '%s')"
  if [[ ! -z $GIT_BRANCH ]]; then
    PS1_GIT="${PS1_DEVIDER}${WHITE}git-branch: ${YELLOW}${GIT_BRANCH}"
  fi

  local FILL_SIZE=$COLUMNS
  local FILL="${GREY}"
  while [[ $FILL_SIZE -gt 0 ]]; do FILL="${FILL}─"; FILL_SIZE=$(($FILL_SIZE-1)); done

  PS1="${FILL}\n${PS1_TIME}${PS1_PWD}${PS1_GIT}${PS1_NEW}"
}

PROMPT_COMMAND=prompt_command

# Colored directories and files
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
