# 🤖 Long-Horizon Agent Harness

A collection of workflow prompts for initializing and managing projects designed for long-running AI agents.

> **Inspired by:**
> - [Anthropic's research on effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
> - [Anthropic's autonomous-coding example](https://github.com/anthropics/claude-quickstarts/tree/main/autonomous-coding)

## 📖 Overview

When AI agents work on complex projects across multiple context windows, they face two key challenges:

1. **One-shotting problem**: Agents try to do too much at once, leaving half-implemented features
2. **Premature completion**: Agents declare the job done before all features are implemented

This harness solves these problems by providing:

- **Project specification** via `app_spec.md` — source of truth for what to build
- **Structured feature tracking** via `feature_list.json` — with categories and verification steps
- **Session progress logging** via `claude-progress.txt` — structured session records
- **Mandatory regression testing** — verify existing features before adding new ones
- **Incremental development workflow** via `/continue`
- **Quick status checks** via `/status`

## 🚀 Quick Start

### For a New Project

1. Copy the `.agent/workflows/` folder to your project's root directory
2. Run `/init` to initialize the harness structure
3. The agent will ask about browser testing and create:
   - `app_spec.md` - Project specification (source of truth)
   - `feature_list.json` - Comprehensive feature requirements with categories
   - `claude-progress.txt` - Progress tracking log
   - `init.sh` / `init.ps1` - Development environment setup script

### For Continuing Work

Run `/continue` to:
- Read project specification and current state
- Run regression checks (MANDATORY before new work)
- Select the next high-priority feature
- Implement, test, and commit incrementally
- Update progress files
- Leave code in a clean, mergeable state

### For Checking Status

Run `/status` to:
- See overall feature completion progress (passing/total with %)
- Review breakdown by priority and category
- Review recent activity and commits
- Identify blocked features
- Get recommendations for next steps

## 📁 Workflow Files

| File                           | Description                                      |
| ------------------------------ | ------------------------------------------------ |
| `.agent/workflows/init.md`     | Initializes a new project with harness structure |
| `.agent/workflows/continue.md` | Incremental development workflow                 |
| `.agent/workflows/status.md`   | Project status and progress report               |

## 🏗️ Project Structure After Initialization

```
<project_root>/
├── .agent/
│   └── workflows/
│       ├── continue.md          # Development workflow
│       └── status.md            # Status report workflow
├── app_spec.md                  # Project specification
├── claude-progress.txt          # Session progress log
├── feature_list.json            # Feature requirements & status
├── init.sh / init.ps1           # Dev environment setup
└── README.md                    # Project documentation
```

## 📋 Feature List Format

Features are tracked in JSON format with categories to prevent accidental modification:

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
      "category": "core|functional|style|ui|integration|performance|security",
      "priority": "critical|high|medium|low",
      "description": "What this feature does",
      "steps": ["Step 1 to verify", "Step 2 to verify"],
      "passes": false,
      "notes": ""
    }
  ]
}
```

> ⚠️ **CRITICAL:** Feature descriptions and steps are IMMUTABLE. Only the `passes` field and `notes` can be modified. Removing or editing features is CATASTROPHIC.

## 📝 Progress Log Format

Session progress is tracked in `claude-progress.txt`:

```
--- Session: 2025-12-15 14:30 ---

Accomplished:
  - Created base project structure
  - Set up development environment

Features Completed:
  - [F001] Project initialization ✅

Issues Discovered/Fixed:
  - None

Completion Status: 1/50 features passing (2%)

Next Session Should:
  - Work on F002 - Basic routing
---
```

## 🔑 Key Principles

Based on Anthropic's research and autonomous-coding example, this harness enforces:

1. **Regression first** — Run existing tests before implementing new features
2. **One feature at a time** — No parallel feature development
3. **End-to-end testing** — Features must be fully verified before marking complete
4. **Commit after every feature** — A feature without a commit does not exist
5. **Feature immutability** — Never edit or remove feature descriptions/steps
6. **Clean state handoffs** — Each session leaves code in a mergeable state
7. **Structured updates** — Progress files are always updated before session end
8. **Same-session continuity** — After `/init`, the agent can immediately start `/continue` workflow

## 🔄 Key Differences from Anthropic's Example

This harness is designed for **IDE-based** usage (Antigravity, Claude Code, Gemini CLI, etc.), not as a standalone Python script. Key adaptations:

| Aspect              | Anthropic Example                                | This Harness                                            |
| ------------------- | ------------------------------------------------ | ------------------------------------------------------- |
| **Execution**       | Standalone Python script with auto-continue loop | IDE-driven, user controls sessions via `/continue`      |
| **Security**        | `security.py` with bash command allowlist        | IDE handles security (user approval flows)              |
| **File reading**    | `cat` commands                                   | IDE's built-in file reading tools (avoids truncation)   |
| **Browser testing** | Puppeteer MCP (mandatory)                        | Optional, configured during `/init`                     |
| **Feature count**   | Fixed 200 features                               | Flexible 20-50 features                                 |
| **Spec format**     | `app_spec.txt` (plain text)                      | `app_spec.md` (markdown for better agent comprehension) |

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

- [Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) - Anthropic's research article
- [Autonomous Coding Example](https://github.com/anthropics/claude-quickstarts/tree/main/autonomous-coding) - Anthropic's reference implementation
- [Claude Prompting Best Practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) - Multi-context window workflows
## 📄 License

MIT License - Feel free to use and modify for your projects.

---

Made with ❤️ for AI-assisted development
