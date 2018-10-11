# `git pull --rebase`

## 1. Alice creates topic branch A, and works on it

## 2. Bob creates unrelated topic branch B, and works on it

## 3. Alice does `git checkout master && git pull`. Master is already up to date

## 4. Bob does `git checkout master && git pull`. Master is already up to date

## 5. Alice does `git merge topic-branch-A`

## 6. Bob does `git merge topic-branch-B`

## 7. Bob does `git push origin master` before Alice

## 8. Alice does `git push origin master`, which is rejected because it's not a fast-forward merge

## 9. Alice looks at origin/master's log, and sees that the commit is unrelated to hers

## 10. Alice does `git pull --rebase origin master`

## 11. Alice's merge commit is unwound, Bob's commit is pulled, and Alice's commit is applied after Bob's commit

## 12. Alice does `git push origin master`, and everyone is happy they don't have to read an useless merge commit when they look at the logs in the future
