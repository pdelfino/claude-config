---
name: peek
description: Read the most recently modified file in ~/Documents/ into context (typically a freshly saved screenshot or dropped file).
disable-model-invocation: true
allowed-tools: Bash(/bin/ls *), Read
---

# Peek at the latest file in ~/Documents

The user has just dropped or saved something into `~/Documents/` (most often a screenshot via Cmd+Shift+4 or Shottr) and wants it in context **now** without having to paste a path.

## Instructions

1. Run `/bin/ls -lt ~/Documents/ | head -5` (not plain `ls` — the user's shell aliases it to `eza`, which rejects `-t` with "Option --time has no 'modified' setting"). `head -5` so you can see the newest few and skip obvious noise (`.DS_Store`, partially-written download crumbs).
2. Pick the first entry that's a real file the user likely means — almost always the top line. Skip `.DS_Store`, `.localized`, and any `*.crdownload` / `*.part` in-progress downloads.
3. Read the file with the right tool for the extension:
   - `.png`, `.jpg`, `.jpeg`, `.gif`, `.webp`, `.heic` → `Read` (it handles images natively as a multimodal input).
   - `.pdf` → `Read` with a `pages` range. If the PDF is >10 pages, start with `pages: "1-5"`.
   - `.md`, `.txt`, `.csv`, `.json`, `.log`, code files → `Read` directly.
   - `.ipynb` → `Read` (it handles notebooks natively).
   - Other binary (`.zip`, `.dmg`, etc.) → don't read, just report the filename + size and ask the user what they want done with it.
4. After reading, **stop and wait**. Do not preemptively summarize, interpret, OCR, or act on the file. A one-line acknowledgment like "Got the screenshot — it shows the Anthropic Console API keys page. What would you like me to do with it?" is enough. The user will tell you what's next. This is the whole point of `/peek`: read it, then pause.

## Notes

- Filenames often contain spaces (e.g., `Screenshot 2026-04-22 at 2.52.09 PM.png`). When passing the path to `Read`, quote it.
- If `~/Documents/` is empty or the only entries are dotfiles, say so and stop — don't guess at other directories.
- Don't modify, move, or delete the file. `/peek` is strictly read-only.
