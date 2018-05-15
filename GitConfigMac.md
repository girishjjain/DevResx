## Mac OS Environment Setup for Git

* Install Visual Studio Code 
* Add Code to your PATH variable 
* Install P4

### Execute below commands to setup git environment 

```
git config --global core.editor "code --wait" 
git config --global alias.gl 'git pull origin master --rebase'
git config --global alias.co checkout
git config --global alias.qs status
git config --global alias.cp cherry-pick
git config --global alias.cm commit
git config --global alias.rb rebase
git config --global alias.dft 'difftool --no-prompt'
git config --global alias.ql 'log -9 --oneline --decorate'
git config --global alias.dfh 'difftool --no-prompt HEAD^'
git config --global alias.br branch
git config --global diff.tool p4mergetool
```
