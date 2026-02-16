---
description: Continue incremental development on the project - pick up where the last session left off
---

# Continue Development Workflow

This workflow helps the agent make incremental progress on the project, following the long-running agent harness pattern.

## Step 1: Get Your Bearings (MANDATORY)

Start by orienting yourself. **Use the IDE's built-in file reading tool** (not `cat`, which truncates output in most IDEs):

1. Read `app_spec.md` to understand what you're building
2. Read `feature_list.json` to see all features and their status
3. Read `claude-progress.txt` to see what was done in previous sessions

// turbo
4. Check recent git history and count remaining work:
   ```bash
   git log --oneline -20
   ```

// turbo
5. Count remaining features:
   ```bash
   grep -c '"passes": false' feature_list.json
   ```

Understanding the full project context is critical before doing any work.

## Step 2: Start Development Environment

6. Start the development environment if not already running:
   - **Windows:** Run `./init.ps1`
   - **macOS/Linux:** Run `chmod +x init.sh && ./init.sh`
   - Or run the appropriate command for your stack (`npm run dev`, `flask run`, etc.)

7. Verify basic functionality is working:
   - Check that the app/server starts without errors
   - **If broken**: Fix before proceeding to new features

## Step 3: Regression Check (MANDATORY)

**MANDATORY BEFORE NEW WORK.** The previous session may have introduced bugs.

8. Run existing project tests (unit, integration):
   ```
   Run the project's test suite (npm test, pytest, cargo test, etc.)
   ```

9. If any tests fail:
   - Mark affected features as `"passes": false` in `feature_list.json`
   - Fix all failures **BEFORE** implementing new features
   - Add discovered issues to `claude-progress.txt`

<!-- BROWSER_TESTING_START -->
10. **Browser verification (if enabled):** Pick 1-2 core features marked as `"passes": true` and verify they still work through the UI:
    - Navigate to the relevant pages
    - Interact like a real user (click, type, scroll)
    - Take screenshots to confirm visual correctness
    - Check browser console for errors

    **If you find ANY issues (functional or visual):**
    - Mark that feature as `"passes": false` immediately
    - Fix before moving to new features
    - This includes UI bugs like:
      * White-on-white text or poor contrast
      * Layout issues or overflow
      * Missing hover states
      * Console errors
      * Broken navigation
<!-- BROWSER_TESTING_END -->

## Step 4: Select Next Feature

11. Analyze `feature_list.json` and select the next feature to implement:

    **Priority Order:**
    1. `critical` priority features first
    2. Then `high` priority
    3. Then `medium` priority
    4. Finally `low` priority

    **Within same priority:**
    - Prefer features that build on already-completed features
    - Prefer features with fewer dependencies
    - Consider logical grouping (finish related features together)

12. Announce your selection:
    > "I will now work on feature **[F###]**: [description]"

## Step 5: Implement the Feature

13. Implement the feature incrementally:
    - Break down into small, testable steps
    - **Write tests** for the new functionality (unit, integration as appropriate)
    - Test after each significant change
    - Write clean, documented code
    - If stuck for >15 minutes, try a different approach or note the blocker

14. **Do NOT** attempt to implement multiple features at once!

## Step 6: Verify the Feature

15. Test the feature **end-to-end** following ALL steps in the feature's `steps` array:

    **For all projects:**
    - Run the project's test suite to ensure no regressions
    - Verify both happy path and edge cases

    **For APIs:**
    - Use curl/httpie to test endpoints
    - Verify response formats and status codes
    - Test error handling

    **For CLI:**
    - Run commands with various inputs
    - Check output and exit codes

<!-- BROWSER_TESTING_START -->
    **For Web UI (browser testing enabled):**

    **DO:**
    - ✅ Test through the UI with clicks and keyboard input
    - ✅ Take screenshots to verify visual appearance
    - ✅ Check for console errors in browser
    - ✅ Verify complete user workflows end-to-end

    **DON'T:**
    - ❌ Only test with curl commands (backend testing alone is insufficient)
    - ❌ Use JavaScript evaluation to bypass UI (no shortcuts)
    - ❌ Skip visual verification
    - ❌ Mark tests passing without screenshot evidence
<!-- BROWSER_TESTING_END -->

16. Only mark as `passes: true` if **ALL** verification steps pass

## Step 7: Update feature_list.json (CAREFULLY!)

**IT IS CATASTROPHIC TO REMOVE OR EDIT FEATURES.**

17. If feature passes verification, change **ONLY** the `passes` field:
    ```json
    "passes": true,
    "notes": "Implemented on <date>. <any relevant notes>"
    ```

**NEVER:**
- ❌ Remove features from the list
- ❌ Edit feature descriptions
- ❌ Modify testing steps
- ❌ Combine or consolidate features
- ❌ Reorder features

**ONLY:**
- ✅ Change `"passes": false` → `"passes": true` after full verification
- ✅ Add notes to the `notes` field

## Step 8: Commit Your Progress (MANDATORY — DO NOT SKIP)

> **⛔ A feature is NOT complete until it is committed.** Do not proceed to the next feature, update progress notes, or do anything else until this step is done. Uncommitted work is lost work.

18. Commit changes **immediately** after verification passes:
    ```bash
    git add -A
    git commit -m "feat(F###): <short description>

    - Implemented: <what was done>
    - Tested: <how it was verified>
    - Notes: <any relevant notes>"
    ```

## Step 9: Update Progress Notes

19. Update `claude-progress.txt` with session details:
    ```
    --- Session: YYYY-MM-DD HH:MM ---
    
    Accomplished:
      - <what you did this session>
    
    Features Completed:
      - [F###] <description> ✅
    
    Issues Discovered/Fixed:
      - <any bugs found and their resolution>
    
    Completion Status: X/Y features passing (XX%)
    
    Next Session Should:
      - <highest priority work for next session>
    ---
    ```

## Step 10: End Session Cleanly

20. Before your context fills up, ensure:

    1. ✅ All working code is committed to git
    2. ✅ `claude-progress.txt` is updated with session summary
    3. ✅ `feature_list.json` reflects actual test status
    4. ✅ No uncommitted changes (`git status` is clean)
    5. ✅ App is in a working state (no broken features, no half-implemented code)

## Step 11: Continue or Stop

21. **Before moving on**, verify your commit landed:
    ```bash
    git status
    git log --oneline -1
    ```
    If there are uncommitted changes — **STOP and go back to Step 8.**

22. After confirming clean state:

    **Continue with next feature:**
    - Go back to Step 4 and select the next priority feature
    - Continue working autonomously until all features are complete

    > **Note:** The system automatically compacts context as needed. Work indefinitely without worrying about context limits. Always aim to complete as many features as possible.

---

## ⚠️ Critical Rules

### DO:
- ✅ Work on **ONE** feature at a time
- ✅ Run regression checks **BEFORE** new work
- ✅ Test **end-to-end** before marking complete
- ✅ Write tests for new functionality
- ✅ Commit **frequently** with descriptive messages
- ✅ Update progress files **before** ending session
- ✅ Leave code in a **clean, working state**
- ✅ Fix broken functionality **before** new features

### DON'T:
- ❌ **Never** edit feature descriptions or steps (CATASTROPHIC)
- ❌ **Never** delete features from the list
- ❌ **Never** mark `passes: true` without full verification
- ❌ **Never** leave half-implemented features
- ❌ **Never** skip the regression check
- ❌ **Never** ignore failing tests
- ❌ **Never** move to the next feature without committing the current one

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

---

> **🔴 REMEMBER: The #1 most common failure mode is forgetting to commit after completing a feature. After EVERY feature: `git add -A && git commit`. A feature without a commit does not exist.**
