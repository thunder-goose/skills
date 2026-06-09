#!/usr/bin/env bash
# Usage: clone-repo.sh <github-url-or-owner/repo> [branch]
set -e

INPUT="$1"
BRANCH="${2:-main}"
DEST="$HOME/code-context-repos"

if [ -z "$INPUT" ]; then
  echo "Usage: clone-repo.sh <url-or-owner/repo> [branch]" >&2
  exit 1
fi

# Expand owner/repo shorthand to full GitHub URL
if [[ "$INPUT" != http* ]]; then
  INPUT="https://github.com/$INPUT"
fi

REPO_NAME="$(basename "$INPUT" .git)"
TARGET="$DEST/$REPO_NAME"

mkdir -p "$DEST"

if [ -d "$TARGET/.git" ]; then
  echo "Already cloned at $TARGET — pulling latest..."
  git -C "$TARGET" pull --ff-only
  exit 0
fi

echo "Cloning $INPUT (branch: $BRANCH) into $TARGET ..."
if git clone --depth=1 -b "$BRANCH" "$INPUT" "$TARGET" 2>/dev/null; then
  echo "Done: $TARGET"
else
  echo "Branch '$BRANCH' not found — trying 'master'..."
  git clone --depth=1 -b master "$INPUT" "$TARGET"
  echo "Done: $TARGET"
fi
