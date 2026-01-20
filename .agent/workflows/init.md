---
description: Initialize a new project with long-running agent harness structure (based on Anthropic's research)
---

# Initialize Long-Horizon Harness

To initialize a project with the long-horizon harness structure, **use the skill**:

1. Read the skill instructions:
   ```
   .agent/skills/long-horizon-harness/SKILL.md
   ```

2. Follow the **Initialization Instructions** in the skill

3. Copy templates from `.agent/skills/long-horizon-harness/templates/` to the target project

The skill contains all templates and detailed instructions for setting up:
- `feature_list.json` — feature tracking
- `claude-progress.txt` — session progress log
- `continue.md` & `status.md` — workflows
- `init.sh` — dev environment script
