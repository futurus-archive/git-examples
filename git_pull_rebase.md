# `git pull --rebase`

## 1. Alice creates topic branch A, and works on it

```bash
# Alice's perspective
      A topic-branch-A
     /
D---E master/origin master
```

## 2. Bob creates unrelated topic branch B, and works on it

```bash
# Bob's perspective
D---E master/origin master
     \
      B topic-branch-B
```

## 3. Alice does `git checkout master && git pull`. Master is already up to date

## 4. Meanwhile, Bob also does `git checkout master && git pull`. Master is already up to date

## 5. Alice does `git merge topic-branch-A` (fast-forward)

```bash
# Alice's perspective
      A topic-branch-A
     / \
D---E---A master
    |
    origin master
```

## 6. Bob does `git merge topic-branch-B` (fast-forward)

```bash
# Bob's perspective
    origin master
    |
D---E---B master
     \ /
      B topic-branch-B
```

## 7. Bob does `git push origin master` before Alice

```bash
# Bob's perspective
D---E---B master/origin master
     \ /
      B topic-branch-B
```

## 8. Alice does `git push origin master`, which is rejected because it's not a fast-forward merge

```bash
# Alice's perspective
      A topic-branch-A
     / \
D---E---A master
     \
      B origin master
```

## 9. Alice looks at origin/master's log, and sees that the commit is unrelated to hers

## 10. Alice does `git pull --rebase origin master`

## 11. Alice's merge commit is unwound, Bob's commit is pulled, and Alice's commit is applied after Bob's commit

```bash
# Alice's perspective
          A topic-branch-A
         / \
D---E---B---A master
        |
        origin master
```

## 12. Alice does `git push origin master`, and everyone is happy they don't have to read an useless merge commit when they look at the logs in the future

```bash
        A topic-branch-A
     /     \
D---E---B---A master/origin master
     \ /
      B
```

## **Alternate reality**

## Step 1 to 9 as before

## 10. Alice does `git pull origin master`

```bash
# Alice's perspective
# M = merge commit
      A topic-branch-A
     / \
D---E---A
     \   \
      \   M master
       \ /
        B - origin master
```

## 11. `origin master`'s commit is replayed on top of `master`, and a new commit along with the names of the two parent commits and a log message from the user describing the changes

## 12. Alice does `git push origin master`, and everyone is wondering why the useless merge commit when they look at the logs in the future

```bash
# M = merge commit
      A topic-branch-A
     / \
D---E---A---M master/origin master
     \     /
      - B -
```
