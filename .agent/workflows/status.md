---
description: Display current project status - show progress, features, and recent activity
---

# Project Status

Quick status check for long-horizon harness projects.

## Quick Steps

// turbo
1. Confirm directory: `pwd`

// turbo
2. Read state files:
   ```bash
   cat claude-progress.txt
   cat feature_list.json
   ```

// turbo
3. Check git:
   ```bash
   git log --oneline -15
   git status
   ```

4. Generate status report with:
   - Feature progress summary (completed/pending/blocked)
   - Recent activity from `claude-progress.txt`
   - Next recommended features
   - Project health indicator

For detailed report format, see: `.agent/skills/long-horizon-harness/templates/status.md`
