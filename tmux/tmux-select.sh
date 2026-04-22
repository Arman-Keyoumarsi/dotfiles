#!/usr/bin/env bash

sessions=$(tmux list-sessions -F '#S' 2>/dev/null)

if [[ -z "$sessions" ]]; then
  echo "No tmux sessions found."
  exit 1
fi

echo "Tmux sessions:"
i=1
while IFS= read -r s; do
  echo "  $i) $s"
  ((i++))
done <<< "$sessions"

echo
read -rp "Select session [1-$((i-1))]: " choice

selected=$(sed -n "${choice}p" <<< "$sessions")

if [[ -z "$selected" ]]; then
  echo "Invalid selection."
  exit 1
fi

exec tmux attach-session -t "$selected"
