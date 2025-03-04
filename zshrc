# Enabling and setting git info var to be used in prompt config.
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
# zstyle ':vcs_info:git*' formats "#%b "
# precmd() {
#    vcs_info
# }
#
# Enable substitution in the prompt.
setopt prompt_subst
#
# Config for the prompt. PS1 synonym.
# prompt='%2/ ${vcs_info_msg_0_}$ '


#
# echo a red asterisk if `git status` returns non-empty

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "%F{red}*%F{reset}"
}

function parse_git_dirty_ascii() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
#
# echo current git branch, or empty string

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1)$(parse_git_dirty)/"
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

#
# show git repo and status in prompot
PS1="\$(pwd_in_git)\$(parse_git_branch)
\$ "

alias npr='npm run'
alias pn=pnpm

export PATH=$HOME/bin:$PATH

# show colorized output in the terminal
export CLICOLOR=

export EDITOR=/usr/bin/vim

export GPG_TTY=$(tty)

export CXXFLAGS="-std=c++17"

PATH="/Users/zburke/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/zburke/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/zburke/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/zburke/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/zburke/perl5"; export PERL_MM_OPT;

alias edit=bbedit

export PATH="/usr/local/var/sonar/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/zburke/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
