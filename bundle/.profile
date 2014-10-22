export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

  GIT_PS1_SHOWUPSTREAM='auto'
  GIT_PS1_SHOWUNTRACKEDFILES='.'
  GIT_PS1_SHOWSTASHSTATE='.'
  GIT_PS1_SHOWDIRTYSTATE='.'
  GIT_PS1_SHOWCOLORHINTS='.'

  GIT_PS1_IS_EXISTS=true
fi

function colorize_prompt {
  local GREY='\[\e[1;30m\]'
  local RED='\[\e[0;31m\]'
  local GREEN='\[\e[0;32m\]'
  local YELLOW='\[\e[0;33m\]'
  local BLUE='\[\e[0;34m\]'
  local CYAN='\[\e[0;36m\]'
  local WHITE='\[\e[0m\]'

  PS1="${GREEN}➜  $GREY\@ $RED| $CYAN\w"

  if [[ ! -z $GIT_PS1_IS_EXISTS ]]; then
    local GIT_BRANCH=$(__git_ps1 '%s')

    if [[ ! -z $GIT_BRANCH ]]; then
      PS1+=" $RED| ${YELLOW}${GIT_BRANCH}"
    fi
  fi

  PS1+="\n${GREEN}➜  $WHITE"
}

PROMPT_COMMAND=colorize_prompt

# Colored directories and files
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
fi

###############################################################################
#                          Custom functions                                   #
###############################################################################
#
# TODO: extract into new file
#
# function track_git_branches {
#   for remote in $(git branch -r | grep -v master); do
#     $(git checkout --track $remote)
#   done
# }
