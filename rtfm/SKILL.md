---
name: rtfm
description: "Ground AI answers in real source code — find usage examples, understand how systems work, and explore codebases. Use when the user wants to ask questions about a codebase, find code examples, understand how a feature is implemented, or explore how a system works. On invoke: shows a numbered list of local git repos, lets the user pick one or more or clone a new repo from GitHub, then searches the selected code to answer their question."
---

# RTFM

Ask your repos, not the internet.

## Step 1 — Pick repos

Run the list script and show the output to the user:

```bash
bash .claude/skills/rtfm/scripts/list-repos.sh
```

Ask the user to:
- Enter numbers to select one or more repos (e.g. `1 3`)
- Or type `new` to clone a repo from GitHub

**If `new`:**
1. Ask: *"GitHub URL or `owner/repo` shorthand?"*
2. Ask: *"Branch? (press Enter for `main`)"*
3. Run:

```bash
bash .claude/skills/rtfm/scripts/clone-repo.sh "<url-or-owner/repo>" "<branch>"
```

4. Re-run the list script and confirm the repo appears, then ask the user to select it.

## Step 2 — Ask the question

> *"What do you want to know about [repo name(s)]?"*

## Step 3 — Search and answer

For each selected repo:

1. Grep for keywords from the user's question
2. Prefer **tests, examples, and READMEs** over deep implementation files
3. Read relevant files — full if small, targeted sections if large
4. Quote code **verbatim** with `file_path:line_number` references; never paraphrase

### Where to look first

| Question type | Start here |
|---|---|
| "How do I use X?" | Tests, example files, README |
| "How does X work?" | Implementation + callers |
| "Where is X configured?" | Config files, env vars, init code |
| Multi-repo | Search each separately, then compare |
