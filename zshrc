# Enabling and setting git info var to be used in prompt config.
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
#zstyle ':vcs_info:git*' formats "#%b "
#precmd() {
#    vcs_info
#}
#
# Enable substitution in the prompt.
#setopt prompt_subst
#
# Config for the prompt. PS1 synonym.
#prompt='%2/ ${vcs_info_msg_0_}$ '


#
# echo a red asterisk if `git status` returns non-empty
function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "%F{red}*%F{reset}"
}

#
# echo current git branch, or empty string
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

#
# echo pwd within git repo, or pwd
function pwd_in_git() {
  if git ls-files >& /dev/null; then
    echo $(echo `pwd` | sed -e 's,'"$(echo "$(git rev-parse --show-toplevel)" | sed -e 's/[^\/]*$//g')"',,g')
  else
    pwd
  fi
}


# PS1="[\$(date +%H:%M)] \$(pwd_in_git)\$(parse_git_branch)
# \$ "

PS1="\$(pwd_in_git)\$(parse_git_branch)
%% "




export GPG_TTY=$(tty)

export CXXFLAGS="-std=c++17"
