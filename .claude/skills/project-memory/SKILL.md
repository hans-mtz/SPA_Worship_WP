---
name: project-memory
description: Use whenever the user references Claude remembering, forgetting, or saving something about this project — a save request ("remember that..."), a recall check ("what do you remember about..."), or a general nudge ("don't forget..."). Ensures memory is actually read or written from the real files, not assumed from conversation context.
---

# Project Memory

This project's persistent memory lives outside this repo, in a per-project folder under `~/.claude/projects/.../memory/`. It survives across sessions; conversation context does not — a fresh session has none of this chat's history, only what's actually saved to disk.

Whenever the user references remembering, forgetting, or saving something about this project, do the following instead of answering from conversation context alone:

1. **Read the actual files first.** List and read the memory folder's `MEMORY.md` index and any relevant entry files before answering "what do you remember" — don't recall from this conversation's history, since a fresh session won't have it.
2. **If asked to save something**, follow the format already established here: a markdown file with frontmatter (`name`, `description`, `metadata.type` — one of `user`, `feedback`, `project`, `reference`), plus a one-line pointer added to `MEMORY.md`. Check for an existing memory file to update before creating a new one — avoid duplicates.
3. **Only save what's genuinely durable and non-obvious** — decisions, rationale, external reference links (e.g. the Google Sheet/Apps Script URLs, which aren't stored anywhere in this repo), or corrected assumptions. Skip anything trivially re-derivable by reading the code or `git log`.
4. **If asked to review what's saved**, either read and summarize the files directly, or remind the user of the `claude-memory` shell function (added to their `~/.zshrc`) which opens the current project's memory folder in Finder from any terminal.
