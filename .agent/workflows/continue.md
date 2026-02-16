---
description: Continue incremental development on the project - pick up where the last session left off
---

# Continue Development

This is a quick-reference workflow. For full instructions, see the **long-horizon-harness** skill.

## Quick Steps

1. **Get bearings** — Read these files using IDE's built-in file reading tool (NOT `cat`):
   - `app_spec.md` — project specification
   - `feature_list.json` — feature status
   - `claude-progress.txt` — previous session notes

// turbo
2. Check git history:
   ```bash
   git log --oneline -15
   ```

3. Start dev environment: `./init.sh` or `./init.ps1` (or appropriate command)

4. **Regression check (MANDATORY):** Run existing tests. Fix failures before new work.

5. Select next feature from `feature_list.json` (priority: critical > high > medium > low)

6. Implement, write tests, and verify the feature

7. Update `feature_list.json` (ONLY change `passes` field!) and `claude-progress.txt`

8. Commit with descriptive message

9. **Continue with the next feature** — work autonomously until done

> **Note:** The system automatically compacts context as needed. Work indefinitely without worrying about context limits.

For detailed instructions, read: `.agent/skills/long-horizon-harness/templates/continue.md`
