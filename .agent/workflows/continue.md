---
description: Continue incremental development on the project - pick up where the last session left off
---

# Continue Development

This is a quick-reference workflow. For full instructions, see the **long-horizon-harness** skill.

## Quick Steps

// turbo
1. Confirm working directory: `pwd`

// turbo
2. Read current state:
   ```bash
   cat claude-progress.txt
   cat feature_list.json
   git log --oneline -10
   ```

3. Start dev environment: `./init.sh` (or appropriate command)

4. Select next feature from `feature_list.json` (priority: critical > high > medium > low)

5. Implement, test, and commit the feature

6. Update `feature_list.json` and `claude-progress.txt`

7. **Continue with the next feature** — work autonomously until done

> **Note:** The system automatically compacts context as needed. Work indefinitely without worrying about context limits.

For detailed instructions, read: `.agent/skills/long-horizon-harness/SKILL.md`
