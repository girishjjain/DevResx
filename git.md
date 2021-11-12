## Git

| Commands | Description |
| --- | --- |
| `git push -d <remote> <branch_name>` | Delete a remote branch. For example, `git push -d upstream featureBranch` |
| `git log --since=1.month --grep="virtual"` | Search for commit logs since last 1 month that contain the word `virtual` |
| `git log -L47,+1:path/to/file` | History of a all revisions to a range of lines |
| `git log --full-history  -- myfile` | Full history of file, even if the file was deleted |
| `git log --pretty=format:%s v6.29.1..v6.29.2` | Short log message of all commits between two tags/commits |
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
| `git format-patch -3` | Extract three topmost commits from current branch and create email-able patches |
| `git format-patch -1 <commit>` | To create patch for given commit |
| `git am file_name.patch` | Apply changes provided in patch file by creating a new commit |
| `git fetch <remote> --tags` | Pull remote tags |
| Add a remote - `git remote add vito git@github.com:vito-c/auth-token-heimdall.git` <br/> Fetch from remote - `git fetch vito` <br/> Checkout branch locally tracking remote branch - `git co -t vito/vito/play27` | To pull a PR branch from colleague locally and work on it |
| `git log --pretty=format:'%cd %nAuthor:%an%nTitle:%s' --date='short'  v2.2.0..HEAD` | Generate short commit logs for all the commits that have been merged since last release |
| `git branch --sort=-committerdate` | List branches ordered by most recent commit |
| `git branch master --set-upstream-to origin/master` | Update remote tracking branch for a local branch |
| `git config --system credential.helper` | Check the value of the git credential manager |
| `git config --system --unset credential.helper` | To unset git credential manager, which will prompt you for password going forward |
| `git diff master HEAD accounts/test/com/rallyhealth/authn/services/ArachneAndLegacyAuthServiceSpec.scala` | Compare a file between two branches |
| `git co <branch_name> -- <paths>` | Check out files from another branch i.e. update working tree with files from another branch |
| `git switch <branch_name>` | Switch branches, even remote branches |

## GitHub Tips
* To open a commit on github web with it's SHA hash, you can append `/commit/sha_hash` to repo URL, for example, `https://github.com/org/repo/commit/d84e64`. You can navigate to the pull request that created the commit and follow all the discussions out there.
* To find commits between two releases using tags, use GitHub compare URL, for e.g. `https://github.com/AudaxHealthInc/rally-play-authentication/compare/v6.26.6...v6.26.8` where `v6.26.8` is a release tag.
* To find all the commits after a certain release, use `https://github.com/AudaxHealthInc/rally-play-authentication/compare/v6.27.0...mail` where `v6.27.0` is release tag and `main` is name of branch.

### Reference
* [Git Reference](https://git-scm.com/docs)
