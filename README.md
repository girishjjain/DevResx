# gitconfig
Git configuration for new development environment (machine/workstation)

git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
git config --global alias.ql "log -9 --oneline --decorate"
git config --global alias.dfh "difftool --no-prompt HEAD^"
git config --global alias.dft "difftool --no-prompt"
git config --global alias.co checkout
git config --global alias.qs status
git config --global alias.cp cherry-pick
git config --global alias.cm commit
git config --global alias.rb rebase

git config --global diff.tool meld
git config --global	difftool.meld.path 'C:\Program Files (x86)\Meld\Meld.exe'

