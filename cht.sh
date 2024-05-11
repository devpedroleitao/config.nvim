#!/usr/bin/env bash

languages=$(echo "typescript javascript angular node" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Query: " query

if echo "$languages" | grep -qs $selected; then
  tmux split-window -h -p 35 bash -c "curl -s cht.sh/$selected/$(echo $query | tr ' ' '+') | less"
else
  curl cht.sh/$selected~$query
fi
