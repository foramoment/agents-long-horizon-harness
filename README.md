# 🤖 Long-Horizon Agent Harness

A collection of workflow prompts for initializing and managing projects designed for long-running AI agents, based on [Anthropic's research on effective harnesses](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents).

## 📖 Overview

When AI agents work on complex projects across multiple context windows, they face two key challenges:

1. **One-shotting problem**: Agents try to do too much at once, leaving half-implemented features
2. **Premature completion**: Agents declare the job done before all features are implemented

This harness solves these problems by providing:

- **Structured feature tracking** via `feature_list.json`
- **Session progress logging** via `claude-progress.txt`
- **Incremental development workflow** via `/continue`
- **Quick status checks** via `/status`

## 🚀 Quick Start

### For a New Project

1. Copy the `.agent/workflows/` folder to your project's root directory
2. Run `/harness-init` to initialize the harness structure
3. The agent will create:
   - `feature_list.json` - Comprehensive feature requirements
   - `claude-progress.txt` - Progress tracking log
   - `init.sh` - Development environment setup script
   - Project-specific `README.md`

### For Continuing Work

Run `/continue` to:
- Read current project state
- Select the next high-priority feature
- Implement and test incrementally
- Update progress files
- Leave code in a clean, mergeable state

### For Checking Status

Run `/status` to:
- See overall feature completion progress
- Review recent activity and commits
- Identify blocked features
- Get recommendations for next steps

## 📁 Workflow Files

| File                               | Description                                      |
| ---------------------------------- | ------------------------------------------------ |
| `.agent/workflows/harness-init.md` | Initializes a new project with harness structure |
| `.agent/workflows/continue.md`     | Incremental development workflow                 |
| `.agent/workflows/status.md`       | Project status and progress report               |

## 🏗️ Project Structure After Initialization

```
<project_root>/
├── .agent/
│   └── workflows/
│       └── continue.md          # Copied from harness
├── claude-progress.txt          # Session progress log
├── feature_list.json            # Feature requirements & status
├── init.sh                      # Dev environment setup
└── README.md                    # Project documentation
```

## 📋 Feature List Format

Features are tracked in JSON format to prevent accidental modification:

```json
{
  "project": {
    "name": "My Project",
    "description": "What the project does",
    "stack": "Technology stack",
    "created_at": "2025-12-15T12:00:00Z"
  },
  "features": [
    {
      "id": "F001",
      "category": "core|functional|ui|integration|performance|security",
      "priority": "critical|high|medium|low",
      "description": "What this feature does",
      "steps": ["Step 1 to verify", "Step 2 to verify"],
      "passes": false,
      "notes": ""
    }
  ]
}
```

## 📝 Progress Log Format

Session progress is tracked in `claude-progress.txt`:

```
--- Session: 2025-12-15 14:30 ---
Feature: [F001] Project initialization
Status: ✅ Completed

Changes Made:
  - Created base project structure
  - Set up development environment
  - Configured build tools

Commits: abc1234
Next Suggested: Work on F002 - Basic routing
---
```

## 🔑 Key Principles

Based on Anthropic's research, this harness enforces:

1. **One feature at a time** - No parallel feature development
2. **End-to-end testing** - Features must be fully verified before marking complete
3. **Clean state handoffs** - Each session leaves code in a mergeable state
4. **Structured updates** - Progress files are always updated before session end
5. **Incremental commits** - Small, logical commits with descriptive messages

## 🌐 Global vs Local Workflows

This repo contains **global workflow templates**. To use them:

**Option A: Global Installation**
```bash
# Copy to global Gemini directory
cp -r .agent/workflows/* ~/.gemini/workflows/
```

**Option B: Per-Project**
```bash
# Copy to specific project
cp -r .agent/workflows/ /path/to/your/project/.agent/workflows/
```

## 🔗 References

- [Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) - Original Anthropic research
- [Claude 4 Prompting Guide](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/claude-4-best-practices) - Multi-context window workflows

## 📄 License

MIT License - Feel free to use and modify for your projects.

---

Made with ❤️ for AI-assisted development
