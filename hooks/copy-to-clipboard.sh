#!/usr/bin/env bash
# Stop hook: when Claude's final message contains a ```copy fenced block,
# copy that block's contents to the macOS clipboard. Maccy, which polls the
# system pasteboard, then captures it automatically.
#
# Convention: Claude wraps paste-ready data in a fenced block tagged `copy`.
# If several appear, the LAST one wins (it's the final answer). No copy block
# -> the hook is a silent no-op, so normal turns are unaffected.
set -uo pipefail

input="$(cat)"

payload="$(printf '%s' "$input" | /usr/bin/python3 -c '
import sys, json, re

try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(0)

path = data.get("transcript_path", "")
if not path:
    sys.exit(0)

# Concatenate the text blocks of the LAST assistant turn in the JSONL transcript.
text = ""
try:
    with open(path, "r") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                obj = json.loads(line)
            except Exception:
                continue
            if obj.get("type") != "assistant":
                continue
            parts = []
            for c in obj.get("message", {}).get("content", []):
                if isinstance(c, dict) and c.get("type") == "text":
                    parts.append(c.get("text", ""))
            if parts:
                text = "\n".join(parts)
except Exception:
    sys.exit(0)

if not text:
    sys.exit(0)

# Match ```copy [optional info] \n <body> \n``` — last block wins.
blocks = re.findall(r"```copy[^\n]*\n(.*?)\n?```", text, re.S)
if not blocks:
    sys.exit(0)

sys.stdout.write(blocks[-1])
')"

[ -n "$payload" ] || exit 0

printf '%s' "$payload" | /usr/bin/pbcopy

# Confirm in the Claude Code UI (static message; no untrusted interpolation).
printf '{"systemMessage": "Copied the marked block to your clipboard (Maccy has it)."}\n'
exit 0
