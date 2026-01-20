---
description: Continue incremental development on the project - pick up where the last session left off
---

# Continue Development Workflow

This workflow helps the agent make incremental progress on the project, following the long-running agent harness pattern.

## Step 1: Get Bearings

// turbo
1. Run `pwd` to confirm working directory

2. Read the current state:
   ```bash
   cat claude-progress.txt
   ```

3. Read feature list:
   ```bash
   cat feature_list.json
   ```

// turbo
4. Check recent git history:
   ```bash
   git log --oneline -10
   ```

## Step 2: Environment Check

5. Start the development environment:
   ```bash
   ./init.sh
   ```
   Or run the appropriate command for your stack (npm run dev, flask run, etc.)

6. Verify basic functionality is working:
   - Check that the app/server starts without errors
   - Test a core feature to ensure nothing is broken
   - **If broken**: Fix before proceeding to new features

## Step 3: Select Next Feature

7. Analyze `feature_list.json` and select the next feature to implement:
   
   **Priority Order:**
   1. `critical` priority features first
   2. Then `high` priority
   3. Then `medium` priority  
   4. Finally `low` priority
   
   **Within same priority:**
   - Prefer features that build on already-completed features
   - Prefer features with fewer dependencies
   - Consider logical grouping (finish related features together)

8. Announce your selection:
   > "I will now work on feature **[F###]**: [description]"

## Step 4: Implement Feature

9. Implement the feature incrementally:
   - Break down into small, testable steps
   - Test after each significant change
   - Write clean, documented code
   - If stuck for >15 minutes, try a different approach or note the blocker

10. **Do NOT** attempt to implement multiple features at once!

## Step 5: Verify Feature

11. Test the feature **end-to-end** following ALL steps in the feature's `steps` array:
    
    **For Web UI:**
    - Use browser automation (Puppeteer MCP, Playwright) if available
    - Manually verify if automation not available
    - Check both happy path and edge cases
    
    **For APIs:**
    - Use curl/httpie to test endpoints
    - Verify response formats and status codes
    - Test error handling
    
    **For CLI:**
    - Run commands with various inputs
    - Check output and exit codes

12. Only mark as `passes: true` if **ALL** verification steps pass

## Step 6: Update State

13. If feature passes, update `feature_list.json`:
    ```json
    {
      "id": "F###",
      "passes": true,
      "notes": "Implemented on <date>. <any relevant notes>"
    }
    ```

14. Update `claude-progress.txt` with session summary:
    ```
    --- Session: YYYY-MM-DD HH:MM ---
    Feature: [F###] <description>
    Status: ✅ Completed
    
    Changes Made:
      - <change 1>
      - <change 2>
      - ...
    
    Next Suggested:
      - <what to work on next>
    
    Blockers/Notes:
      - <any issues encountered>
    ---
    ```

15. Commit changes with descriptive message:
    ```bash
    git add -A
    git commit -m "feat(F###): <short description>

    - Implemented: <what was done>
    - Tested: <how it was verified>
    - Notes: <any relevant notes>"
    ```

## Step 7: Clean State Check

16. Before ending the session, verify:
    
    - [ ] All changes are committed to git
    - [ ] No syntax errors or build failures
    - [ ] `claude-progress.txt` is updated
    - [ ] `feature_list.json` is updated (if feature completed)
    - [ ] Development server can still start
    - [ ] Code is in a **mergeable state** (no half-implemented features)

## Step 8: Decide Next Action

17. After completing a feature:
    
    **Continue with next feature:**
    - Go back to Step 3 and select the next priority feature
    - Continue working autonomously until all features are complete
    
    > **Note:** The system automatically compacts context as needed, so you can work indefinitely without worrying about context limits. Always aim to complete as many features as possible in a single session.

---

## ⚠️ Critical Rules

### DO:
- ✅ Work on **ONE** feature at a time
- ✅ Test **end-to-end** before marking complete
- ✅ Commit **frequently** with descriptive messages
- ✅ Update progress files **before** ending session
- ✅ Leave code in a **clean, working state**
- ✅ Fix broken functionality **before** new features

### DON'T:
- ❌ **Never** edit feature descriptions or steps
- ❌ **Never** delete features from the list
- ❌ **Never** mark `passes: true` without full verification
- ❌ **Never** leave half-implemented features
- ❌ **Never** skip the environment check
- ❌ **Never** ignore failing tests

---

## 🔧 Handling Issues

### If the app is broken:
1. Check `git log` for recent changes
2. Try `git diff HEAD~1` to see what changed
3. Fix the issue OR `git revert HEAD` to restore working state
4. Update progress file with issue details

### If a feature is blocked:
1. Note the blocker in `feature_list.json` notes field
2. Update `claude-progress.txt` with details
3. Move to a different feature that's not blocked
4. Come back to blocked feature later

### Before context compaction:
> The system will automatically compact your context window when needed. Before this happens:
1. Ensure all current work is committed
2. Update `claude-progress.txt` with current state
3. The session will continue automatically after compaction

---

## 📊 Session Summary Template

At the end of each session, provide a summary:

```
## Session Summary

**Duration:** ~X minutes
**Feature(s) Worked On:** F###, F###
**Status:** Completed / Partial / Blocked

### Completed:
- [F###] Feature description ✅

### In Progress:
- [F###] Feature description (X% done)

### Blocked:
- [F###] Feature description - Reason: ...

### Next Session Should:
1. First priority task
2. Second priority task

### Notes:
- Any important observations
- Technical decisions made
- Potential issues to watch
```
