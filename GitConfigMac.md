## Mac OS Environment Setup for Git

* Install Visual Studio Code
* Add Code to your PATH variable, refer "Launching from the Command Line" https://code.visualstudio.com/docs/setup/mac
* Install P4
* Install meld for directory diff from: https://yousseb.github.io/meld/

### Execute below commands to setup git environment
```
git config --global user.name "Girish Jayantilal Jain"
git config --global user.email girish.jain@domain.com
git config --global credential.usehttppath true
git config --global core.editor "code --wait"
git config --global core.autocrlf false
git config --global alias.gl "pull origin master --rebase"
git config --global alias.co checkout
git config --global alias.qs status
git config --global alias.ss status
git config --global alias.cp cherry-pick
git config --global alias.cm commit
git config --global alias.rb rebase
git config --global alias.dft "difftool --no-prompt"
git config --global alias.ql "log -9 --oneline --decorate"
git config --global alias.dfh "difftool --no-prompt HEAD^"
git config --global alias.br branch
git config --global alias.pl "log --graph --pretty=format:'%C(dim green)%h%Creset %Cgreen(%cr) -%C(magenta)%d%Creset %C(cyan)%s%Creset %C(yellow)<%an>%Creset' --abbrev-commit -10"
git config --global diff.tool vscode
git config --global diff.guitool vscode
git config --global merge.tool vscode
git config --global merge.guitool vscode
git config --global mergetool.keepbackup false
git config --global alias.ddft 'difftool --tool meld --dir-diff'
git config --global difftool.intellij.cmd 'idea diff $(cd $(dirname "$LOCAL") && pwd)/$(basename "$LOCAL") $(cd $(dirname "$REMOTE") && pwd)/$(basename "$REMOTE")'
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
git config --global alias.cam "commit --amend --no-edit"
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
git config --global merge.conflictStyle diff3
git config --global merge.verbosity 3
git config --global alias.cam "commit --amend --no-edit"
git config --global pull.rebase false
git config --global init.defaultBranch main
git config --system core.longpaths true
git config --global core.longpaths true 
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'C:/Users/GirishJayantilalJain/.ssh/id_ed25519.pub'
```

## Pull Request Review Config
* Use following bash script to pull PR/MR branch to local:
```sh
#! /bin/bash

# Default remote branch name
DEFAULT_REMOTE="main"

# Use provided branch name or default to 'main'
REMOTE_BRANCH=${2:-$DEFAULT_REMOTE}

git co $REMOTE_BRANCH
git br -D pr$1
git pull
git fetch origin merge-requests/$1/head:pr$1
git co pr$1
git dft $REMOTE_BRANCH...HEAD --name-only
git dft $REMOTE_BRANCH...HEAD
```
