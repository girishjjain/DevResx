# Lyric Bash Configuration
```sh
alias devresx='cd /c/Users/GirishJayantilalJain/repos/personal/DevResx/'
alias cxt='cd /c/repos/totalpayment/cxt/TPPCXT/src'
alias ls='ls -lah'
alias prr=~/prr.sh
alias sl='clear ; git ss ; git pl'
alias np='notepad'
alias tpic='cd /c/repos/TotalPayment/tpic'
alias ruleeng='cd /c/repos/RuleEngine'
alias autotune='cd /c/repos/autotune'
alias npp='/c/Program\ Files/Notepad++/notepad++.exe'
alias platform='cd /c/repos/platform'
alias sitar='cd /c/repos/platform/sitar'
alias napster='cd /c/repos/platform/napster'
alias orchestra='cd /c/repos/platform/orchestra'
alias rewind='cd /c/repos/platform/rewind'
alias metronome='cd /c/repos/platform/metronome'
alias invoicing='cd /c/repos/totalpayment/cxt/invoicing'
alias devdeployment='cd /c/repos/DevOps/app-operations-dev'
alias qadeployment='cd /c/repos/DevOps/app-operations-qa'
alias proddeployment='cd /c/repos/DevOps/app-operations-prod'
alias deployment='cd /c/repos/DevOps'

function rgrep() {
  git grep -n "$1" -- "$2";
}

function sitardevdeployment_pr() {
  cd '/c/repos/DevOps/app-operations-dev'
  git co master
  git pull
  git co sitar
  git rb master
  sed -i -E "s/(tag: ).*/\1$1/" "./shared-charts/lyric-app-v1/values/sitar-platform-dev.yaml"
  unix2dos "./shared-charts/lyric-app-v1/values/sitar-platform-dev.yaml"
  git diff
  git dft
  git add "./shared-charts/lyric-app-v1/values/sitar-platform-dev.yaml"
  git cm -m "Deploying sitar build $1 on development environment"
  git push origin sitar
}

function sitarqadeployment_pr() {
  cd '/c/repos/DevOps/app-operations-qa'
  git co master
  git pull
  git co sitar
  git rb master
  sed -i -E "s/(tag: ).*/\1$1/" "./shared-charts/lyric-app-v1/values/sitar-platform-qa.yaml"
  unix2dos "./shared-charts/lyric-app-v1/values/sitar-platform-qa.yaml"
  git diff
  git dft
  git add "./shared-charts/lyric-app-v1/values/sitar-platform-qa.yaml"
  git cm -m "Deploying sitar build $1 on QA environment"
  git push origin sitar
}

function deploysitar() {
  sitardevdeployment_pr "$1"
  sitarqadeployment_pr "$1"
}

function metronomedevdeployment_pr() {
  cd '/c/repos/DevOps/app-operations-dev'
  git co master
  git pull
  git co metronome
  git rb master
  sed -i -E "s/(tag: ).*/\1$1/" "./shared-charts/lyric-app-v1/values/metronome-platform-dev.yaml"
  unix2dos "./shared-charts/lyric-app-v1/values/metronome-platform-dev.yaml"
  git diff
  git dft
  git add "./shared-charts/lyric-app-v1/values/metronome-platform-dev.yaml"
  git cm -m "Deploying metronome build $1 on development environment"
  git push origin metronome
}

function metronomeqadeployment_pr() {
  cd '/c/repos/DevOps/app-operations-qa'
  git co master
  git pull
  git co metronome
  git rb master
  sed -i -E "s/(tag: ).*/\1$1/" "./shared-charts/lyric-app-v1/values/metronome-platform-qa.yaml"
  unix2dos "./shared-charts/lyric-app-v1/values/metronome-platform-qa.yaml"
  git diff
  git dft
  git add "./shared-charts/lyric-app-v1/values/metronome-platform-qa.yaml"
  git cm -m "Deploying metronome build $1 on QA environment"
  git push origin metronome
}
```