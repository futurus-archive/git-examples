# Git Workshop

## [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

The basic Git workflow goes something like this:

- You modify files in your working tree.

- You selectively stage just those changes you want to be part of your next commit, which adds only those changes to the staging area.

- You do a commit, which takes the files as they are in the staging area and stores that snapshot permanently to your Git directory.

![Three ares](images/areas.png)

Two important points:

> ### Git Generally Only Adds Data
> When you do actions in Git, nearly all of them only add data to the Git database. It is hard to get the system to do anything that is not undoable or to make it erase data in any way. As with any VCS, you can lose or mess up changes you haven’t committed yet, but after you commit a snapshot into Git, it is very difficult to lose, especially if you regularly push your database to another repository.
>
> This makes using Git a joy because we know we can experiment without the danger of severely screwing things up. For a more in-depth look at how Git stores its data and how you can recover data that seems lost, see Undoing Things.

and

> ### (Almost) Everything is recoverable
> Remember, anything that is committed in Git can almost always be recovered. Even commits that were on branches that were deleted or commits that were overwritten with an --amend commit can be recovered. However, anything you lose that was never committed is likely never to be seen again.

## Git 101

### Configuration [book/en/v2/Customizing-Git-Git-Configuration](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# Set up commit template
git config --global commit.template ~/.gitmessage.txt
```

### Alias [book/en/v2/Git-Basics-Git-Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)

```bash
git config --global alias.co checkout # git co

git config --global alias.ci commit # git ci

git config --global alias.st status # git st

git config --global alias.ss "status -s" # git st

git config --global alias.unstage "reset HEAD --" # git unstage bad_file

git config --global alias.lgp "log --graph --pretty=format:'%C(bold white)%h%Creset -%C(bold green)%d%Creset %s %C(bold green)(%cr)%Creset %C(bold blue)<%an>%Creset %n' --abbrev-commit --date=relative --branches"
```

[Pretty Format](https://git-scm.com/docs/pretty-formats)

### Tag [book/en/v2/Git-Basics-Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

```bash
git tag

git tag -l "v1.*" # or --list

# Annotated tag (contains all info)
git tag -a v1.4 -m "my version 1.4"

# Lightweight tag (just commit)
git tag v1.4-lw

# Tag past commit
git tag -a v1.2 9fceb02

# Share tag
git push origin v1.5
# or multi
git push origin --tags

# Delete tag
git tag -d v1.4-lw

# Delete remote tag
git push origin :refs/tags/v1.4-lw
```

### Stash [book/en/v2/Git-Tools-Stashing-and-Cleaning](https://git-scm.com/book/en/v2/Git-Tools-Stashing-and-Cleaning)

Use to temporarily save work in progress in order to switch branch, etc. without creating a commit.

```bash
$ git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   lib/simplegit.rb



$ git stash
Saved working directory and index state \
  "WIP on master: 049d078 added the index file"
HEAD is now at 049d078 added the index file
(To restore them type "git stash apply")



$ git status
# On branch master
nothing to commit, working directory clean



$ git stash list
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: c264051 Revert "added file_size"
stash@{2}: WIP on master: 21d80a5 added number to log
```

Use `git stash apply` to replay the stash snapshot.

```bash
$ git stash apply
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   index.html
  modified:   lib/simplegit.rb

no changes added to commit (use "git add" and/or "git commit -a")
```

```bash
$ git stash apply --index
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   lib/simplegit.rb
```

Note: `git stash pop` will apply then remove the stash snapshot.

```bash
$ git status -s
M  index.html
 M lib/simplegit.rb

$ git stash --keep-index
Saved working directory and index state WIP on master: 1b65b17 added the index file
HEAD is now at 1b65b17 added the index file

$ git status -s
M  index.html
```

Note: Include untracked files with `-u` flag.

```bash
$ git status -s
M  index.html
 M lib/simplegit.rb
?? new-file.txt

$ git stash -u
Saved working directory and index state WIP on master: 1b65b17 added the index file
HEAD is now at 1b65b17 added the index file

$ git status -s
$
```

### Create a branch from stash

```bash
$ git stash branch testchanges
M index.html
M lib/simplegit.rb
Switched to a new branch 'testchanges'
On branch testchanges
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   lib/simplegit.rb

Dropped refs/stash@{0} (29d385a81d163dfd45a452a2ce816487a6b8b014)
```

### Cleaning your Working Directory

Command: `git clean`

Tip: ALWAYS run with `-n` flag (dry run)

Flags:

- `-d`: delete
- `-x`: delete files in `.gitignore` as well
- `-f`: force (DANGEROUS!)
- `-i`: interactive mode

```bash
$ git status -s
 M lib/simplegit.rb
?? build.TMP
?? tmp/

$ git clean -n -d
Would remove build.TMP
Would remove tmp/

$ git clean -n -d -x
Would remove build.TMP
Would remove test.o
Would remove tmp/
```

## [Feature Branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)

## You-messed-up [book/en/v2/Git-Basics-Undoing-Things](https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things)

### `git amend`

### `git reset` [book/en/v2/Git-Tools-Reset-Demystified](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified)

```
git revert
```

### `git reflog` [book/en/v2/Git-Internals-Maintenance-and-Data-Recovery#_data_recovery](https://git-scm.com/book/en/v2/Git-Internals-Maintenance-and-Data-Recovery#_data_recovery)

## Workflow: `git pull` (merge) vs `git pull --rebase`

- Rebase scenarios based on branch workflow:
  - Rebase to catch up with master
  - Rebase off of a feature branch
  - Rebase interactively
