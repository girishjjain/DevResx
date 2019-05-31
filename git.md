## Git

| Commands | Description |
| --- | --- |
| `git push -d <remote_origin> <branch_name>` | Delete a remote branch. For example, `git push -d upstream featureBranch` |
| `git log --full-history  -- myfile` | Full history of file, even if the file was deleted |
| `git show sha1Hash -- path/to/file` | Show contents of a certain file in a commit |
| `git add -p path/to/file` | To partially stage a file, git would let you choose individual hunks |
| `git tag` | List all tags |
| `git tag -a tagName` | Create an annotated tag that store extra meta information such as tagger name, email, and date |
| `git tag tagName` | Create a lightweight tag |


### Reference
* [Git Reference](https://git-scm.com/docs)
