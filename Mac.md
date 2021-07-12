# Mac OS Notes

### NotesMacOSX
* To "maximize" a window (not full screen) - 
https://apple.stackexchange.com/questions/139884/make-the-green-full-screen-window-icon-on-yosemite-maximize-windows

### Environment variables
To setup environment variables, use below command:
```
defaults write ~/.MacOSX/environment proxy "http://http-proxy.health.ge.com:88/"
defaults write ~/./environment https_proxy "http://http-proxy.health.ge.com:88/"
```

### Keyboard Shortcuts
* Cmd + Down Arrow - To open a file/folder in Finder
* Cmd + Down Arrow - To move cursor to end of document/editor
* Cmd + Up Arrow - To move cursor to start of document/editor
* Fn + F11 - To show desktop (pressed once will show desktop and repeating it will bring you back to the window that was active before desktop was displayed)
* Shift + Cmd + 5 - To capture screenshot or record screen
* `Cmd + Shift + .` - To show hidden files in Finder

### Commands
* `brew tap` - lists the currently tapped repositories
* `brew untap <user/repo>` - removes given taps, for e.g. `brew untap mongodb/brew` 
* `brew install <package-name>` - to install a Homebrew package
* `brew info <package-name>` - to get information about a package installed using brew
* `brew list` - to get list of all installed Homebrew packages
* `brew update` - to update Homebrew itself
* `brew upgrade <package-name>` - upgrade a package
* `brew reinstall <package-name>` - reinstall a package
* `xcrun simctl list` - to list simulators available
* `xcrun simctl boot <UUID>` - to start simulator identified by given UUID


### Configuration
* Key-stroke repeat settings:
```bash
defaults read NSGlobalDomain KeyRepeat
defaults read NSGlobalDomain InitialKeyRepeat

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 9
```
