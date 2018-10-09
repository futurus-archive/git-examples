# Git Workshop

## [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

The basic Git workflow goes something like this:

- You modify files in your working tree.

- You selectively stage just those changes you want to be part of your next commit, which adds only those changes to the staging area.

- You do a commit, which takes the files as they are in the staging area and stores that snapshot permanently to your Git directory.

![Three ares](images/areas.png)

> ### Git Generally Only Adds Data
> When you do actions in Git, nearly all of them only add data to the Git database. It is hard to get the system to do anything that is not undoable or to make it erase data in any way. As with any VCS, you can lose or mess up changes you haven’t committed yet, but after you commit a snapshot into Git, it is very difficult to lose, especially if you regularly push your database to another repository.
>
> This makes using Git a joy because we know we can experiment without the danger of severely screwing things up. For a more in-depth look at how Git stores its data and how you can recover data that seems lost, see Undoing Things.

## Git 101

### [Configuration](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

### [Alias](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)

### [Tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

### [Stash](https://git-scm.com/book/en/v2/Git-Tools-Stashing-and-Cleaning)

## [Feature Branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)

## You-messed-up
git amend
git reset (--soft/--hard)
git revert
git reflog

Workflow:
git pull (merge) vs git pull --rebase
Rebase scenarios based on branch workflow:
Rebase to catch up with master
Rebase off of a feature branch
Rebase interactively
