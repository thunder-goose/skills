#!/usr/bin/env bash
# Find git repos in the home directory (excludes common noise dirs)
find "$HOME" -maxdepth 5 -name ".git" -type d \
  ! -path "*/node_modules/*" \
  ! -path "*/.cache/*" \
  ! -path "*/vendor/*" \
  ! -path "*/.local/*" \
  ! -path "*/.cargo/*" \
  2>/dev/null \
  | sed 's|/.git$||' \
  | sort \
  | nl -ba
