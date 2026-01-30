# Git and Pull Requests: A Beginner's Guide

This guide explains the basics of **Git** (version control) and **Pull Requests** (collaboration), specifically tailored to help you understand how to manage your project.

---

## 1. What is Git? 🌳
**Git** is a tool that tracks changes in your code over time. Think of it like a "Save Game" system for your project.
*   It allows you to travel back in time to previous versions.
*   It allows multiple people to work on the same project without deleting each other's work.

## 2. What is a Pull Request (PR)? 🔀
A **Pull Request (PR)** is a way to propose changes to the main codebase.
1.  You create a separate "branch" (a copy of the code) to work on a specific task (e.g., "delete-unused-folder").
2.  You finish your work and "push" it to the cloud (GitHub).
3.  You open a **PR** to ask the project owner (or yourself) to **compare** your changes and **merge** them into the main project.

It acts as a safety checkpoint to review code before it becomes permanent.

---

## 3. The "Standard" Workflow 🔄

Here is the step-by-step process we used to remove that folder:

### Step 1: Check your status
Always check what branch you are on and if you have unsaved changes.
```bash
git status
```

### Step 2: Create a new "Branch"
Never make big changes directly on `main`. Create a safe separate space.
```bash
# git checkout -b [new-branch-name]
git checkout -b remove-nested-app
```

### Step 3: Make your changes (Code!)
*You delete the folder, edit files, etc.*

### Step 4: "Stage" your changes
Tell Git which files you want to include in this "save point".
```bash
# Add all changed files
git add .
```

### Step 5: "Commit" your changes
Save the changes with a message describing what you did.
```bash
git commit -m "Deleted the unnecessary ecommerce_store folder"
```

### Step 6: "Push" to GitHub
Send your new branch to the cloud.
```bash
# git push origin [branch-name]
git push origin remove-nested-app
```

### Step 7: Create the Pull Request
*   Go to your GitHub repository URL.
*   You will see a yellow banner saying **"remove-nested-app had recent pushes"**.
*   Click **"Compare & pull request"**.
*   Review the changes and click **"Create pull request"**.

---

## 4. Common Commands Cheat Sheet 📜

| Command | Description |
| :--- | :--- |
| `git clone [url]` | Downloads a project from GitHub to your computer. |
| `git status` | Shows which files have been changed. |
| `git pull` | Updates your local computer with the latest changes from GitHub. |
| `git checkout [branch]` | Switches to a different branch. |
| `git checkout -b [name]` | Creates and switches to a new branch. |
| `git add .` | Prepares all modified files to be saved. |
| `git commit -m "msg"` | Saves the prepared files with a descriptive message. |
| `git push` | Uploads your saved changes to GitHub. |

---

## 5. Summary Example
If you wanted to add a new "About Us" page:

1.  `git checkout -b add-about-page` (Create branch)
2.  *Create `about.html` file...* (Do work)
3.  `git add .` (Stage)
4.  `git commit -m "Added about us page"` (Save)
5.  `git push origin add-about-page` (Upload)
6.  *Go to GitHub and create PR* (Review & Merge)
