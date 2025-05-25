# 01 - Git Basics

Welcome to the first module of the **epam-ios-1** course. This section introduces you to version control using Git — the most widely used Distributed Version Control System (DVCS) in modern software development.

---

## 📚 What You’ll Learn

- Why version control systems (VCSs) are essential
- What Git is and how it works
- Common Git commands and workflows
- Basic branching and collaboration techniques
- Command-line vs GUI interfaces for Git

---

## 📘 1. A Brief History of Version Control Systems

Imagine you’re a solo developer building a growing codebase. Eventually, you’ll want to:

- Track the history of your changes
- Identify when bugs were introduced
- Revert to earlier states of the project

A naive solution might be duplicating your project folder with timestamps — but this is error-prone and unmanageable.

**Enter Version Control Systems (VCS):**  
Tools that automatically track changes, manage history, and support collaboration. Git is one such system.

---

## 🌀 2. What Is Git?

Git is a **Distributed Version Control System (DVCS)**, meaning:

- You can work **offline** — changes are stored locally
- Every developer has a **full copy** of the repository
- There’s **no single point of failure**

### Why Git?

- **Local-first**: No internet required for most operations
- **Fast**: Commands execute quickly because they don’t hit a server
- **Snapshot model**: Git saves full snapshots, not just diffs
- **Resilient**: Every clone is a full backup

> Git is the current industry standard, originally created by Linus Torvalds (creator of Linux).

---

## 🧪 3. Common Git Commands

Here’s a practical workflow to get started.

### 🆕 Initializing or Cloning a Project

```bash
git init                # Create a new repo in your project
git clone <url>         # Clone a remote repo to your machine
```

🌿 Working with Branches

```bash
git branch              # List all local branches
git branch Feature_1    # Create new branch from current one
git switch Feature_1    # Switch to that branch
```

It’s safer to work on a separate feature branch rather than directly on main.

📝 Staging and Committing

```bash
git status              # Check current state
git add .               # Stage all changes
git add MyFile.swift    # Or stage individual files
git commit -m "msg"     # Commit staged changes
```

Git tracks changes in three areas:
 - Working Tree – where you edit files
 - Staging Area – where you prepare files to commit
 - Git Directory – where snapshots are stored

And three states:
 - Modified – changed but not staged
 - Staged – ready to be committed
 - Committed – saved to the repository

🔀 Merging Branches

```bash
git switch main
git merge Feature_1
```

🔄 Syncing with Remote

```bash
git pull origin main          # Get latest changes from remote
git push origin Feature_1     # Push your branch to remote
```

After pushing, create a Merge Request (Pull Request) to merge your changes via GitLab or GitHub.

⸻

🖥️ 4. Git: GUI vs Command Line
 - Git GUI tools (e.g. GitKraken, Sourcetree, GitHub Desktop, Xcode’s Source Control) provide a visual interface.
  - Git CLI gives more power and flexibility. Recommended in the long run.

⸻

🎯 Learning Objectives
 - [x] Initialize and clone repositories
 - [x] Use Git via command line (init, commit, push, pull, branch, merge)
 - [x] Understand the role of local branches and remotes
 - [x] Navigate Git history with basic commands

⸻

📎 Additional Resources
 - [Official Git tutorial](https://git-scm.com/docs/gittutorial)
 - [Official Git video tutorial](https://git-scm.com/videos)
 - [Wonderful lesson about Git and GitHub for begginers](https://www.youtube.com/watch?v=RGOj5yH7evk)
 - [Hello world - creating the first Swift program in simple words](https://matteomanferdini.com/swift-hello-world/)


⸻

This module is an entry point. You’ll explore advanced concepts like merge conflicts, rebasing, and branching strategies in future lessons.
