## Git

| Commands | Description |
| --- | --- |
| `git config --list --show-origin` | Shows git configuration and the config file origin for it |
| `git push -d <remote> <branch_name>` | Delete a remote branch. For example, `git push -d upstream featureBranch` |
| `git log --since=1.month --grep="virtual"` | Search for commit logs since last 1 month that contain the word `virtual` |
| `git log -L47,+1:path/to/file` | History of all revisions to a range of lines |
| `git log -- path/to/folder` | To view history of given folder |
| `git log --full-history  -- path/to/file` | Full history of file, even if the file was deleted |
| `git log --pretty=format:%s v6.29.1..v6.29.2` | Short log message of all commits between two tags/commits |
| `git log main..feature` | List commits that were added on the given (feature) branch (after it was branched off of the main branch OR using the merge-base i.e. common ancesotr, of the two branches)  |
| `git log --all --grep="search_string"` | Searches commit logs across all branches |
| `git show sha1Hash -- path/to/file` | Show contents of a certain file in a commit |
| `git show sha1Hash:path/to/file` | Show contents of a certain file at the time of given commit, or from a branch, `git show branch:path/to/file` |
| `git add --patch path/to/file` | To partially stage a file, git would let you choose individual hunks |
| `git add --edit path/to/file` | To manually pick and choose lines of the patch to apply |
| `git tag` | List all tags |
| `git tag -a tagName` | Create an annotated tag that store extra meta information such as tagger name, email, and date |
| `git tag tagName` | Create a lightweight tag |
| `git co tags/v7.15.3 -b temp2` | Checkout a speicific tag to branch |
| `git push --follow-tags` | Push commits and tags that are both annotated and reachable from pushed commits |
| `git checkout HEAD^ path/to/file` | Check-out previous version of file |
| `git stash list` | Lists all previously stored stashes |
| `git stash save <name>` | Saves a named stash |
| `git stash apply stash@{0}` | Apply changes from numbered stash to working directory |
| `git stash show -p stash@{1}` | Print changes of the named stash to console |
| `git format-patch -3` | Extract three topmost commits from current branch and create email-able patches |
| `git format-patch -1 <commit>` | To create patch for given commit |
| `git am file_name.patch` | Apply changes provided in patch file by creating a new commit |
| `git fetch <remote> --tags` | Pull remote tags |
| Add a remote - `git remote add vito git@github.com:vito-c/auth-token-heimdall.git` <br/> Fetch from remote - `git fetch vito` <br/> Checkout branch locally tracking remote branch - `git co -t vito/vito/play27` | To pull a PR branch from colleague locally and work on it |
| `git log --pretty=format:'%cd %nAuthor:%an%nTitle:%s' --date='short'  v2.2.0..HEAD` | Generate short commit logs for all the commits that have been merged since last release |
| `git branch --sort=-committerdate` | List branches ordered by most recent commit |
| `git branch master --set-upstream-to origin/master` | Update remote tracking branch for a local branch |
| `git config --system credential.helper OR git config --global credential.helper` | Check the value of the git credential manager |
| `git config --system --unset credential.helper` | To unset git credential manager, which will prompt you for password going forward |
| `git diff master HEAD accounts/test/com/rallyhealth/authn/services/ArachneAndLegacyAuthServiceSpec.scala` | Compare a file between two branches |
| `git diff main HEAD` | To list changes between the tip of two branches |
| `git diff main...HEAD` | To list changes that occurred on current branch since when the current branch was started off of main. You can use the branch names as well - `git diff topic...master` |
| `git co <branch_name> -- <paths>` | Check out files from another branch i.e. update working tree with files from another branch |
| `git switch <branch_name>` | Switch branches, even remote branches |
| `git config --global credential.useHttpPath true` | To configure Git to cache credentials for each local directory where you clone a repository. This becomes very useful when you are working with multiple Github.com accounts on the same machine. |
| `git branch -m <old_name> <new_name>` | Rename branch |
| `git grep -n 'search_text_or_regex'` | Search through committed tree, working directory, or index for given string or regular expression |
| ` git grep -l 'search_text_or_regex'` | Search for given regular expression and list the matching files. It is helpful when the given regex is found multiple times within same file and you'd like to just get the list of all the files that contain matching regex |
| ` git grep -e Fake --and -e dao -- '*.cs'` | Search for two regular expressions, 'Fake' and 'dao' together on the same line and print line number, using `-n` flag |
| `git merge-base branc1 branch2` | Shows the common ancestor (merge-base) commit of the two branches |
| `git ls-files` | List all the files that Git is currently tracking in a repository |
| `git ls-files \| grep -viE '\.cs$'` | List files tracked by git that do not end with .cs extension. Here `-v` inverts the match, i.e. shows lines that do not match the pattern, `-i` ignores case, `-E` uses extended regular expressions |
| `git clean -fdx` | Force clean everything that's not part of repository. -f for force clean, -d for removing untracked directories, and -x for removing ignored files |

## GitHub Tips
* To open a commit on github web with it's SHA hash, you can append `/commit/sha_hash` to repo URL, for example, `https://github.com/org/repo/commit/d84e64`. You can navigate to the pull request that created the commit and follow all the discussions out there.
* To find commits between two releases using tags, use GitHub compare URL, for e.g. `https://github.com/AudaxHealthInc/rally-play-authentication/compare/v6.26.6...v6.26.8` where `v6.26.8` is a release tag.
* To find all the commits after a certain release, use `https://github.com/AudaxHealthInc/rally-play-authentication/compare/v6.27.0...mail` where `v6.27.0` is release tag and `main` is name of branch.

### Reference
* [Git Reference](https://git-scm.com/docs)
