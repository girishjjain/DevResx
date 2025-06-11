## Windows

### Commands
* To print contents of a file on command prompt: `type file.txt`

### Winget
* To get list of installed packages
  * `winget list`
* To get help with winget
  * `winget --help`

### Installation
* VS Code
  * `winget install -e --id Microsoft.VisualStudioCode`
* Git
  * `winget install --id Git.Git -e --source winget`
* WSL
  * To see currently installed distributions
    * `wsl -l -v`
  * To list available distributions
    * `wsl --list --online`
  * To install default distribution
    * `wsl --install`
  * To shutdown all running instances
    * `wsl --shutdown`
  * To stop a specific WSL instance
    * `wsl --terminate <distribution_name>`, for example, `wsl --terminate Ubuntu`
* Powershell
  * `winget install --id Microsoft.Powershell --source winget`
  * Configuration
    * To enable menu option to complete current command - `Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete`

### Windows Terminal
* Launch PowerShell profile using `notepad $PROFILE`
* Configure PowerShell profile with following to get predictive intellisense and suggestions as you type command:
```powershell
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
```
