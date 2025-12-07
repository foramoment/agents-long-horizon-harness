---
description: Initialize a new project with long-running agent harness structure (based on Anthropic's research)
---

# Harness Initialization Workflow

This workflow sets up a project structure that enables AI agents to work effectively across multiple context windows, based on [Anthropic's research on effective harnesses](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents).

## Step 1: Gather Project Information

Ask the user for the following information:

1. **Project Name**: What is the name of this project?
2. **Project Description**: Brief description of what the project should do (1-3 sentences)
3. **Technology Stack**: What technologies will be used? (e.g., "Next.js + TypeScript + Tailwind", "Python Flask + SQLite", "Vite + React")
4. **Project Type**: What type of project is this? (web app, CLI tool, API, library, mobile app, etc.)

## Step 2: Create Project Directory Structure

Create the base directory structure:

```
<project_root>/
├── .agent/
│   └── workflows/
│       └── continue.md          # Workflow for incremental progress
├── claude-progress.txt          # Progress log for agent sessions
├── feature_list.json            # Comprehensive feature requirements
├── init.sh                      # Script to start development environment
└── README.md                    # Project documentation
```

## Step 3: Generate Feature List

Based on the project description, generate a comprehensive `feature_list.json` file.

### Feature List Format

```json
{
  "project": {
    "name": "<project_name>",
    "description": "<project_description>",
    "stack": "<technology_stack>",
    "created_at": "<ISO_date>",
    "last_updated": "<ISO_date>"
  },
  "features": [
    {
      "id": "F001",
      "category": "core|functional|ui|integration|performance|security",
      "priority": "critical|high|medium|low",
      "description": "Clear description of what this feature does",
      "steps": [
        "Step 1 to verify this feature works",
        "Step 2 to verify this feature works",
        "..."
      ],
      "passes": false,
      "notes": ""
    }
  ]
}
```

### Feature Generation Guidelines

1. **Be Comprehensive**: Generate 20-50+ features depending on project complexity
2. **Start with Core**: Begin with foundational features (setup, basic structure)
3. **Break Down Large Features**: Each feature should be implementable in a single session
4. **Include Testing Steps**: Every feature must have clear verification steps
5. **Prioritize Correctly**:
   - `critical`: Project won't work without this
   - `high`: Core functionality
   - `medium`: Important but not blocking
   - `low`: Nice-to-have, polish

### Feature Categories

- **core**: Project setup, configuration, base structure
- **functional**: Main business logic and features
- **ui**: User interface components and styling
- **integration**: External APIs, databases, third-party services
- **performance**: Optimization, caching, lazy loading
- **security**: Authentication, authorization, input validation

## Step 4: Create claude-progress.txt

Create the progress tracking file:

```txt
# Claude Progress Log
# Project: <project_name>
# Created: <date>

================================================================================
SESSION LOG
================================================================================

[No sessions recorded yet]

================================================================================
CURRENT STATE
================================================================================

Status: Not Started
Last Working Commit: None
Blocking Issues: None

================================================================================
NEXT STEPS
================================================================================

1. Run /continue to begin implementing features
2. Start with critical priority features
3. Work incrementally, one feature at a time
```

## Step 5: Create init.sh

Generate a project-appropriate initialization script:

```bash
#!/bin/bash

# =============================================================================
# Project: <project_name>
# Description: Development environment initialization script
# =============================================================================

set -e

echo "🚀 Starting <project_name> development environment..."

# --- Dependency Installation ---
# Uncomment/modify based on your stack:

# Node.js projects:
# if [ -f "package.json" ]; then
#     echo "📦 Installing Node.js dependencies..."
#     npm install
# fi

# Python projects:
# if [ -f "requirements.txt" ]; then
#     echo "🐍 Installing Python dependencies..."
#     pip install -r requirements.txt
# fi

# --- Start Development Server ---
# Modify based on your stack:

# Node.js:
# npm run dev &

# Python Flask:
# flask run &

# Python FastAPI:
# uvicorn main:app --reload &

# --- Wait for Server ---
echo "⏳ Waiting for server to start..."
sleep 3

# --- Health Check ---
# Modify the URL based on your project:
# curl -s http://localhost:3000/health || echo "⚠️ Health check failed"

echo "✅ Development environment ready!"
echo ""
echo "📋 Quick Reference:"
echo "   - Progress Log: claude-progress.txt"
echo "   - Feature List: feature_list.json"
echo "   - Continue Work: /continue"
```

## Step 6: Create /continue Workflow

Create `.agent/workflows/continue.md` with the following content:

```markdown
---
description: Continue incremental development on the project - pick up where the last session left off
---

# Continue Development Workflow

This workflow helps the agent make incremental progress on the project.

## Step 1: Get Bearings

// turbo
1. Run `pwd` to confirm working directory

2. Read the current state:
   - Read `claude-progress.txt` to understand recent work
   - Read `feature_list.json` to see all features and their status
   - Run `git log --oneline -10` to see recent commits

## Step 2: Environment Check

3. Run `./init.sh` or equivalent to start the development server

4. Verify basic functionality is working:
   - Check that the app starts without errors
   - Test a core feature to ensure nothing is broken
   - If broken, fix before proceeding to new features

## Step 3: Select Next Feature

5. From `feature_list.json`, select the highest-priority feature where `passes: false`
   - Priority order: critical > high > medium > low
   - Within same priority, prefer features that build on completed ones

6. Announce: "I will now work on feature [ID]: [description]"

## Step 4: Implement Feature

7. Implement the feature incrementally:
   - Make small, testable changes
   - Test after each significant change
   - If stuck for more than 15 minutes, consider a different approach

## Step 5: Verify Feature

8. Test the feature end-to-end:
   - Follow ALL steps listed in the feature's `steps` array
   - Use browser automation (Puppeteer/Playwright) for UI testing if available
   - Use curl/httpie for API testing
   - Only mark as `passes: true` if ALL steps pass

## Step 6: Update State

9. If feature passes, update `feature_list.json`:
   - Set `passes: true`
   - Add any relevant notes

10. Commit changes:
    ```bash
    git add -A
    git commit -m "feat: [F###] <short description>

    - Implemented: <what was done>
    - Tested: <how it was verified>
    - Notes: <any relevant notes>"
    ```

11. Update `claude-progress.txt`:
    ```
    --- Session: <date> <time> ---
    Feature: [ID] <description>
    Status: ✅ Completed / ⚠️ Partial / ❌ Blocked
    Changes:
      - <list of changes made>
    Commits: <commit hashes>
    Next: <suggested next steps>
    Time Spent: <approximate time>
    ---
    ```

## Step 7: Clean State Check

12. Before ending session, ensure:
    - [ ] All changes are committed
    - [ ] No syntax errors or build failures
    - [ ] Progress file is updated
    - [ ] Feature list is updated
    - [ ] Code is in a mergeable state

## ⚠️ Important Rules

- **ONE feature at a time**: Do not start a new feature until the current one is complete or explicitly deferred
- **Never edit feature descriptions**: Only change `passes` and `notes` fields
- **Never delete features**: Even if they seem redundant
- **Always test end-to-end**: Unit tests alone are not sufficient
- **Leave clean state**: The next session should be able to start fresh
- **Commit frequently**: Small, logical commits with descriptive messages
```

## Step 7: Create README.md

Create a README with project overview and agent instructions:

```markdown
# <project_name>

<project_description>

## Tech Stack

- <technology_stack>

## Getting Started

```bash
# Initialize development environment
./init.sh
```

## Agent Instructions

This project uses the long-running agent harness pattern. Key files:

| File | Purpose |
|------|---------|
| `feature_list.json` | All features with implementation status |
| `claude-progress.txt` | Session-by-session progress log |
| `init.sh` | Development environment setup |
| `.agent/workflows/continue.md` | Workflow for incremental progress |

### For AI Agents

1. **First time?** Read `feature_list.json` and `claude-progress.txt`
2. **Continuing?** Run `/continue` to pick up where you left off
3. **Always** commit your work and update progress files before ending

## Features Progress

See `feature_list.json` for the complete feature list and current status.

## License

MIT
```

## Step 8: Initialize Git Repository

```bash
git init
git add -A
git commit -m "chore: initial project setup with agent harness

- Created feature_list.json with comprehensive feature requirements
- Added claude-progress.txt for session tracking
- Added init.sh for development environment
- Set up /continue workflow for incremental development"
```

## ✅ Completion Checklist

After running this workflow, verify:

- [ ] `feature_list.json` exists with 20+ features
- [ ] `claude-progress.txt` exists with initial template
- [ ] `init.sh` exists and is executable
- [ ] `.agent/workflows/continue.md` exists
- [ ] `README.md` exists with project overview
- [ ] Git repository is initialized with first commit
- [ ] All features in `feature_list.json` have `passes: false`

## 🚀 Next Steps

Tell the user:

"Project harness is ready! Here's how to continue:

1. **Review** `feature_list.json` - add/modify features if needed
2. **Customize** `init.sh` for your specific setup
3. **Run** `/continue` to start implementing features incrementally

Each session will:
- Pick up where the last one left off
- Work on ONE feature at a time
- Leave the codebase in a clean, working state
- Update progress tracking files

Good luck! 🎉"
