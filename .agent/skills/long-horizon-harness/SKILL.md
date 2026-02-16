---
name: Long-Horizon Harness
description: Initialize a project structure for long-running autonomous AI agent development, based on Anthropic's research on effective harnesses.
---

# 🚀 Long-Horizon Harness

This skill sets up a project structure for effective long-running AI agent work, with progress persistence across sessions.

> **Based on:**
> - [Anthropic's research on effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
> - [Anthropic's autonomous-coding example](https://github.com/anthropics/claude-quickstarts/tree/main/autonomous-coding)

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
├── app_spec.md          # Project specification (source of truth)
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
5. **Browser testing?** — Will you use browser-based verification (Puppeteer, Playwright, browser subagent)? This affects the generated `continue.md` workflow.

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
templates/app_spec.md         → <project>/app_spec.md
templates/init.ps1            → <project>/init.ps1  (Windows)
templates/init.sh             → <project>/init.sh   (macOS/Linux)
```

> **Cross-platform:** Use OS-appropriate commands (`cp` on Unix, `Copy-Item` on Windows).

**If browser testing is NOT enabled:** Remove sections between `<!-- BROWSER_TESTING_START -->` and `<!-- BROWSER_TESTING_END -->` comments in the copied `continue.md`.

### Step 3: Personalize

Update the copied files:

1. **app_spec.md:**
   - Fill in project specification based on user's description
   - Include all core features, UI/UX requirements, and technical constraints
   - This file is the **source of truth** that the agent reads at every session start

2. **feature_list.json:**
   - Replace `<project_name>`, `<description>`, `<stack>`
   - Generate 20-50 features based on project description and `app_spec.md`
   - Use correct priorities: `critical` → `high` → `medium` → `low`
   - Assign appropriate categories: `core`, `functional`, `style`, `ui`, `integration`, `performance`, `security`

3. **claude-progress.txt:**
   - Replace placeholders with actual data

4. **init.ps1 / init.sh:**
   - Configure for project stack (npm/pip/cargo/dotnet etc.)
   - Windows: `init.ps1` supports winget for system dependencies
   - Unix: Make executable with `chmod +x init.sh`

5. **README.md:**
   - Create or update with project information

### Step 4: Git

```bash
git init  # if not already initialized
git add -A
git commit -m "chore: initialize long-horizon harness structure

- Added app_spec.md with project specification
- Added feature_list.json with project requirements
- Added claude-progress.txt for session tracking  
- Added /continue and /status workflows
- Added init script for development environment"
```

### Step 5: Report to User

> ✅ **Harness ready!**
> 
> - View status: `/status`
> - Start working: `/continue`
> - Feature list: `feature_list.json`
> - Project spec: `app_spec.md`
> 
> The agent will work autonomously, preserving progress across sessions.

### Step 6: If User Says "Continue" in This Session

The user may ask you to start implementing features immediately after initialization, in the same session. **This is the most common scenario.** When this happens:

1. Read the `continue.md` workflow you just created at `<project>/.agent/workflows/continue.md`
2. Skip Steps 1-3 (you already have context from init) and go directly to **Step 4: Select Next Feature**
3. Follow the workflow exactly from that point — especially the commit and verification rules

> **The workflow rules in `continue.md` are not suggestions — they are mandatory.** The most critical ones are:
> - ⛔ **Commit after EVERY feature** — a feature is not done until committed
> - Run regression checks before new work
> - Never edit feature descriptions or steps

## ⚡ Key Principles

### Autonomy
- The system automatically compacts context as needed — work without limits
- Before compaction, ensure everything is committed
- Don't stop artificially — continue as long as there's work to do

### One Feature at a Time
- Fully complete a feature before moving to the next
- **Commit after each completed feature** — a feature without a commit does not exist
- Update `feature_list.json` and `claude-progress.txt`
- Verify `git status` is clean before starting the next feature

### Regression Testing
- **Always run existing tests before implementing new features**
- Fix regressions before adding new functionality
- A broken codebase takes priority over new work

### Browser Verification (if enabled)
- Test through the actual UI, not just API endpoints
- Take screenshots to verify visual correctness
- Check for console errors and layout issues

### Clean State
- Code should always be in a working state
- No half-implemented features
- **Every completed feature must be committed before starting the next one**
- Next session should start with a clean slate

### Feature Immutability
- **NEVER** remove or edit feature descriptions/steps — this is CATASTROPHIC
- Only change the `passes` field (false → true) and add `notes`

---

> **🔴 For every feature, the loop is: Implement → Test → Update feature_list.json → COMMIT → Update progress → Next feature. Never skip the COMMIT step.**
