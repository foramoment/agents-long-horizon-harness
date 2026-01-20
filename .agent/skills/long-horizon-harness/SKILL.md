---
name: Long-Horizon Harness
description: Initialize a project structure for long-running autonomous AI agent development, based on Anthropic's research on effective harnesses.
---

# 🚀 Long-Horizon Harness

This skill sets up a project structure for effective long-running AI agent work, with progress persistence across sessions.

> **Based on:** [Anthropic's research on effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)

## 🎯 When to Use

- Project requires implementing many features (10+)
- Work will span multiple sessions
- Need progress tracking and state persistence
- Agent should work as autonomously as possible

## 📁 What Gets Created

```
<project>/
├── .agent/workflows/
│   ├── continue.md      # Workflow for continuing work
│   └── status.md        # Workflow for viewing status
├── feature_list.json    # All features with priorities
├── claude-progress.txt  # Session log and progress
├── init.sh / init.ps1   # Dev environment startup script (OS-specific)
└── README.md            # Project documentation
```

## 📋 Initialization Instructions

### Step 1: Gather Information

Ask the user for:
1. **Project name**
2. **Description** (1-3 sentences)
3. **Technology stack** (e.g., "Next.js + TypeScript", "Python Flask + SQLite")
4. **Project type** (web app, CLI, API, library)

### Step 2: Copy Templates

Copy files from `templates/` to the project.

**Choose init script based on OS:**
- **Windows** → use `templates/init.ps1`
- **macOS/Linux** → use `templates/init.sh`

```
templates/continue.md         → <project>/.agent/workflows/continue.md
templates/status.md           → <project>/.agent/workflows/status.md
templates/feature_list.json   → <project>/feature_list.json
templates/claude-progress.txt → <project>/claude-progress.txt
templates/init.ps1            → <project>/init.ps1  (Windows)
templates/init.sh             → <project>/init.sh   (macOS/Linux)
```

> **Cross-platform:** Use OS-appropriate commands (`cp` on Unix, `Copy-Item` on Windows).

### Step 3: Personalize

Update the copied files:

1. **feature_list.json:**
   - Replace `<project_name>`, `<description>`, `<stack>`
   - Generate 20-50 features based on project description
   - Use correct priorities: `critical` → `high` → `medium` → `low`

2. **claude-progress.txt:**
   - Replace placeholders with actual data

3. **init.ps1 / init.sh:**
   - Configure for project stack (npm/pip/cargo/dotnet etc.)
   - Windows: `init.ps1` supports winget for system dependencies
   - Unix: Make executable with `chmod +x init.sh`

4. **README.md:**
   - Create or update with project information

### Step 4: Git

```bash
git init  # if not already initialized
git add -A
git commit -m "chore: initialize long-horizon harness structure

- Added feature_list.json with project requirements
- Added claude-progress.txt for session tracking  
- Added /continue and /status workflows
- Added init.sh for development environment"
```

### Step 5: Report to User

> ✅ **Harness ready!**
> 
> - View status: `/status`
> - Start working: `/continue`
> - Feature list: `feature_list.json`
> 
> The agent will work autonomously, preserving progress across sessions.

## ⚡ Key Principles

### Autonomy
- The system automatically compacts context as needed — work without limits
- Before compaction, ensure everything is committed
- Don't stop artificially — continue as long as there's work to do

### One Feature at a Time
- Fully complete a feature before moving to the next
- Commit after each completed feature
- Update `feature_list.json` and `claude-progress.txt`

### Clean State
- Code should always be in a working state
- No half-implemented features
- Next session should start with a clean slate
