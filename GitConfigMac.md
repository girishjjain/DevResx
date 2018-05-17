## Mac OS Environment Setup for Git

* Install Visual Studio Code 
* Add Code to your PATH variable, refer "Launching from the Command Line" https://code.visualstudio.com/docs/setup/mac
* Install P4

### Execute below commands to setup git environment 

```
git config --global user.name "Girish Jayantilal Jain"
git config --global core.editor "code --wait" 
git config --global alias.gl 'pull origin master --rebase'
git config --global alias.co checkout
git config --global alias.qs status
git config --global alias.cp cherry-pick
git config --global alias.cm commit
git config --global alias.rb rebase
git config --global alias.dft 'difftool --no-prompt'
git config --global alias.ql 'log -9 --oneline --decorate'
git config --global alias.dfh 'difftool --no-prompt HEAD^'
git config --global alias.br branch
git config --global diff.tool p4merge
git config --global diff.guitool p4merge
git config --global merge.tool p4merge
git config --global merge.guitool p4merge
git config --global difftool.p4merge.cmd '/Applications/p4merge.app/Contents/Resources/launchp4merge $LOCAL $REMOTE'
git config --global mergetool.keepBackup false
git config --global mergetool.p4mergetool.cmd "/Applications/p4merge.app/Contents/Resources/launchp4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
```
