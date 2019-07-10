# Bash
* File names starting with . makes file hidden
* Mac OS file names are not case sensitive (by default)
* File extensions are optional on Unix

### Quoting, Escaping
* Backslash escapes a single character
* Single quotes - Escape all characters between them

### Paths
* Absolute paths start with / (which is root)
* Relative paths don't start with / and are resolved relative to current directory

### Environment Variables
* To list all environment variables use `printenv` 
* To list all environment variables that contain given string `printenv | grep partString`
* To display value of a specific environment variable `echo $envvarname`
* To set an environment variable 
  * `echo "export MY_ENV_VAR=\"new value\"" >> ~/.bash_profile && source ~/.bash_profile`

### Commands
| Command | Description |
|--|--|
| `ls -R` | Lists whole directory recursively |
| `cp -R` | Copies everthing in the subdirectories recursively |
| `open .` | Opens current working directory in Finder |
| `rm -rf <dir-name>` | Delete directory and its contents without prompting for confirmation |
| `lsof -i:8090` | Lists open processes on given port number |

##### less
less is a terminal pager command, lets you read content as pages instead of terminal spitting it all out at once and scrolling to the end.
* `less -p <pattern>` to search for a string pattern
* within less use n key to continue searching forward 
* Refer [here](https://en.wikipedia.org/wiki/Less_(Unix)) for detailed less commands 

##### ssh
ssh command starts SSH client that establishes secure SSH connection to a remote SSH server. It provides secure encrypted connection between two hosts over an insecure network. Refer [here](https://www.ssh.com/ssh/command/) for more details. Usage:
* `ssh remotesshserver.com`
* `ssh user@remotesshserver.com`
* `ssh -p 2222 user@remotesshserveripaddress`
* `ssh fuzzle_dev@sftp-internal.rally-integration.werally.in -i ~/fuzzle_dev_id_rsa` - SSH to a host using given identity file containing privake key for user account specified
* `ssh-keyscan -H jump-phi.werally.in >> ~/.ssh/known_hosts` - Add remote host fingerprint to known_hosts file (beaware this does not prevent man-in-the-middle attack)


##### find 
* find walks file hierarchy and prints each entry to terminal - you can use it to search for directories/files 
    * `find .` to recursively walk file hierarchy from current directory
    * `find /` to recursively walk file hierarchy from root directory
     * `find ~` to recursively walk file hierarchy from user home directory
     * `find . -type d` to recursively walk file hierarchy for *directories* from current directory
     * `find . -type f` to recursively walk file hierarchy for *files* from current directory
     * `find . -type f -name *partFileName.ext` to recursively walk file hierarchy for *files* from current directory to match given file name pattern
     * `grep findStr $(find . -name *Parser.scala -type f)` to recursively walk file hierarchy for *files* from current directory and then using grep to filter output to match files that contain (or match) given findStr pattern
     
##### alias
* alias is essentially a keyboard shortcut, an abbreviation, a means of avoiding typing a long command sequence
    * `alias ls='ls -lah'` to setup a new alias for ls command that would show long listing, hidden files, and descriptive size


### Bash wildcards 
* \* matches anything, including nothing at all 
* ? matches exactly a single character 
* [] matches one of the characters in the list, for e.g. [acd7_] would match either a, c, d, 7, or _ character and nothing else. You can negate the list of characters by starting the list with ^ character. Ranges work well too, for e.g. [a-z], [0-9], [A-C3-9]
  

### Brace Expansion 
* Helps with generating strings, its syntax takes following form: pre{list,of,string}post 
* Bash would expand each string within curly brace with pre and post string, for e.g. touch {a,b,c}.txt would be expanded to touch a.txt b.txt c.txt 
* Brace expansion comes before wildcard expansion 
  

### Output Redirection 
* \> You can redirect standard outout stream using greater than command > it saves output of command to file, for e.g. ls > listing.txt saves output of ls command to file listing.txt 
* \>> Appends output to end of file 


### Pipe  
* Sends output of one program as input to another program 


### Command Substitution  
* Replace a command with its output 
* Put command between $() for e.g. `echo "hello $(whoami)"` would result in bash executing whoami command and replacing it in echo command 


### Jobs and Processes  
* To run a command in background append & at the end and that would cause bash to run it in the background so that user can continue using terminal. 
* To avoid getting any output from background command printed on screen, redirect its output to a file by using > command 
* Background jobs can't read input from user, hence its best to only run those programs in background that don't need user input 
* ^Z suspends a running job, after suspending a job use fg to bring job to foreground or bg to send it to background 
* To kill a foreground program use ^C 
* Use kill command to end any program (can only end processes you own), for e.g.  
```
    kill %2 // would kill job id 2 

    kill %cp // would kill cp program 

    kill 3344 // would kill process with id 3344 
```
* Use jobs command to see list of all running jobs 
* Use ps command to see list of all running processes under a terminal

##### killall
* You can kill a process by name by using `killall` command. For e.g. `killall ZoomOpener`
