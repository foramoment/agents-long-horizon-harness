---
description: Display current project status - show progress, features, and recent activity
---

# Project Status

Quick status check for long-horizon harness projects.

## Quick Steps

// turbo
1. Confirm directory: `pwd`

2. Read state files using IDE's built-in file reading tool (NOT `cat`):
   - `claude-progress.txt`
   - `feature_list.json`

// turbo
3. Count progress:
   ```bash
   echo "Passing: $(grep -c '"passes": true' feature_list.json 2>/dev/null || echo 0) / Total: $(grep -c '"passes"' feature_list.json 2>/dev/null || echo 0)"
   ```

// turbo
4. Check git:
   ```bash
   git log --oneline -15
   git status
   ```

5. Generate status report with:
   - Feature progress summary (passing/total with percentage)
   - Breakdown by priority and category
   - Recent activity from `claude-progress.txt`
   - Next recommended features
   - Project health indicator

For detailed report format, see: `.agent/skills/long-horizon-harness/templates/status.md`
