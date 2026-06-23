#!/usr/bin/env bash
# Announce new files in ~/Documents/ since the last prompt.
# Paths only — don't dump file contents.
# Wired from ~/.claude/settings.json UserPromptSubmit hook.

set -uo pipefail

STATE_DIR="$HOME/.claude/state"
STATE_FILE="$STATE_DIR/documents-last-seen"

mkdir -p "$STATE_DIR"

if [ -f "$STATE_FILE" ]; then
  TS=$(cat "$STATE_FILE")
else
  TS=$(date +%s)
fi

# Guard against a corrupted or pre-epoch state file. macOS BSD find
# rejects pre-1970 dates for -newermt, so clamp to something reasonable.
if ! [[ "$TS" =~ ^[0-9]+$ ]] || [ "$TS" -lt 946684800 ]; then
  TS=$(date +%s)
fi

# macOS BSD find doesn't accept "@UNIXTIMESTAMP" (that's GNU find).
# Use space separator, NOT "T" — BSD find silently truncates ISO 8601
# T-separated datetimes to just the date portion, matching every file
# from that day regardless of time.
REF_DATE=$(date -r "$TS" "+%Y-%m-%d %H:%M:%S")

# Top-level files only, skip dotfiles (.DS_Store etc.).
NEW_FILES=$(find "$HOME/Documents" -maxdepth 1 -type f -newermt "$REF_DATE" ! -name ".*" 2>/dev/null)

if [ -n "$NEW_FILES" ]; then
  printf '<system-notice>\n'
  printf 'New files appeared in ~/Documents/ since last prompt. Consider reading any that look relevant:\n'
  printf '<file-list>\n%s\n</file-list>\n' "$NEW_FILES"
  printf 'For images/PDFs, use the Read tool. For text files, Read or cat as appropriate.\n'
  printf '</system-notice>\n'
fi

date +%s > "$STATE_FILE"

exit 0
