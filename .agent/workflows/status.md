---
description: Display current project status - show progress, features, and recent activity
---

# Project Status Workflow

This workflow provides a comprehensive overview of the current project state, including feature progress, recent activity, and next steps.

## Step 1: Confirm Working Directory

// turbo
1. Run `pwd` to confirm you're in the correct project directory

## Step 2: Read Project State Files

2. Read the progress log to understand recent activity:
   ```bash
   cat claude-progress.txt
   ```

3. Read the feature list to see all features and their status:
   ```bash
   cat feature_list.json
   ```

## Step 3: Analyze Git History

// turbo
4. Check recent commits for context:
   ```bash
   git log --oneline -15
   ```

// turbo
5. Check for any uncommitted changes:
   ```bash
   git status
   ```

## Step 4: Generate Status Report

6. After reading all files, generate a comprehensive status report in the following format:

```markdown
# 📊 Project Status Report
Generated: <current_date_time>

## 🎯 Project Overview
- **Name:** <project_name>
- **Description:** <project_description>
- **Stack:** <technology_stack>
- **Created:** <created_date>

---

## 📈 Feature Progress

### Summary
| Status      | Count | Percentage |
| ----------- | ----- | ---------- |
| ✅ Completed | X     | XX%        |
| ⏳ Pending   | X     | XX%        |
| 🚫 Blocked   | X     | XX%        |
| **Total**   | X     | 100%       |

### By Priority
- **Critical:** X/X completed
- **High:** X/X completed
- **Medium:** X/X completed
- **Low:** X/X completed

### By Category
- **Core:** X/X completed
- **Functional:** X/X completed
- **UI:** X/X completed
- **Integration:** X/X completed
- **Performance:** X/X completed
- **Security:** X/X completed

---

## ✅ Recently Completed Features
<List of last 5 completed features with IDs and descriptions>

## ⏳ Next Features To Implement
<List of next 5 features to work on, based on priority>

## 🚫 Blocked Features (if any)
<List of blocked features with reasons from notes>

---

## 📝 Recent Activity

### Last 3 Sessions
<Summary from claude-progress.txt>

### Recent Commits
<Last 5-10 commits from git log>

---

## 🔮 Recommendations

### Immediate Next Steps
1. <Most important next action>
2. <Second priority>
3. <Third priority>

### Potential Blockers
- <Any identified risks or blockers>

### Technical Debt
- <Any noted technical debt or cleanup needed>

---

## 📁 Project Files Status
- `feature_list.json`: <number of features> features tracked
- `claude-progress.txt`: <number of sessions> sessions logged
- `init.sh`: <exists/missing>
- Git: <clean/uncommitted changes>
```

## Step 5: Provide Quick Summary

7. After the detailed report, provide a quick TL;DR summary:

```
## 🚀 TL;DR

**Progress:** X/X features (XX%) completed
**Last Activity:** <date> - <what was done>
**Current Focus:** <current or next feature>
**Health:** 🟢 Good / 🟡 Needs Attention / 🔴 Critical Issues
```

---

## ⚠️ Notes

- This workflow is **read-only** - it does not modify any files
- Use `/continue` to start working on features
- If the project appears unhealthy, address issues before implementing new features
- The status report should help any new agent session quickly understand the project state
