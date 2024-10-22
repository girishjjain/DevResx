# Copy below lines to .bash_profile file on your local. Please DO NOT copy this file as it does not have [dot] prefix in the file name
alias ls='ls -lah'
alias prr=~/prr.sh
alias sl='clear ; git ss ; git pl'
alias np='notepad'
alias npp='/c/Program\ Files/Notepad++/notepad++.exe'

function rgrep() {
  git grep -n "$1" -- "$2";
}
