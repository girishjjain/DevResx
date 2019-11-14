## Git

| Commands | Description |
| --- | --- |
| `git push -d <remote_origin> <branch_name>` | Delete a remote branch. For example, `git push -d upstream featureBranch` |
| `git log --full-history  -- myfile` | Full history of file, even if the file was deleted |
| `git show sha1Hash -- path/to/file` | Show contents of a certain file in a commit |
| `git show sha1Hash:path/to/file` | Show contents of a certain file at the time of given commit |
| `git add --patch path/to/file` | To partially stage a file, git would let you choose individual hunks |
| `git add --edit path/to/file` | To manually pick and choose lines of the patch to apply |
| `git tag` | List all tags |
| `git tag -a tagName` | Create an annotated tag that store extra meta information such as tagger name, email, and date |
| `git tag tagName` | Create a lightweight tag |
| `git push --follow-tags` | Push commits and tags that are both annotated and reachable from pushed commits |
| `git checkout HEAD^ path/to/file` | Check-out previous version of file |
| `git stash list` | Lists all previously stored stashes |
| `git stash save <name>` | Saves a named stash |
| `git stash apply stash@{0}` | Apply changes from numbered stash to working directory |
| `git format-patch -3` | Extract three topmost commits from current branch and create email-able patches |
| `git am file_name.patch` | Apply changes provided in patch file by creating a new commit |


## GitHub Tips
* To open a commit on github web with it's SHA hash, you can append `/commit/sha_hash` to repo URL, for example, `https://github.com/org/repo/commit/d84e64`. You can navigate to the pull request that created the commit and follow all the discussions out there.
 

### Reference
* [Git Reference](https://git-scm.com/docs)
