# Git Change Control Workflow

## Purpose

This document records the Git-based change control workflow used in the Enterprise Admin Foundation lab.

The goal is to simulate enterprise change management by avoiding direct untracked changes and using branches, commits, merges, and tags.

## Workflow

The basic workflow is:

1. Confirm the working tree is clean.
2. Create a feature branch.
3. Make the change.
4. Review the change using `git diff`.
5. Stage the change using `git add`.
6. Commit the change with a meaningful message.
7. Switch back to `master`.
8. Merge the feature branch.
9. Delete the completed branch.
10. Tag stable project checkpoints.

## Commands Used

Create and switch to a branch:

git checkout -b feature/update-ops-menu-docs

Review changes:

git status
git diff

Stage and commit:

git add docs/operations-menu.md
git commit -m "Document operations menu change control workflow"

Switch back to master:

git checkout master

Merge branch:

git merge feature/update-ops-menu-docs

Delete branch:

git branch -d feature/update-ops-menu-docs

Create tag:

git tag -a phase-1a-linux-admin-complete -m "Phase 1A Linux admin foundation complete"

View tags:

git tag
git show phase-1a-linux-admin-complete

## Operational Value

This workflow simulates how infrastructure teams control changes to scripts, documentation, automation, and configuration.

It helps create a traceable history of what changed, when it changed, and why it changed.
