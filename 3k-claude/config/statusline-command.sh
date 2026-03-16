#!/bin/bash

input=$(cat)

# Extract model name
model=$(echo "$input" | jq -r '.model.display_name')

# Extract context window usage
used_context=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Build output
output="$model"

if [ -n "$used_context" ]; then
  output="$output | Used Context: ${used_context}%"
fi

echo "$output"
