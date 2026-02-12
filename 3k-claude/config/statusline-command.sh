#!/bin/bash

input=$(cat)

# Extract model name
model=$(echo "$input" | jq -r '.model.display_name')

# Extract context window usage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Extract current token count from last API call
current_tokens=$(echo "$input" | jq -r '
  if .context_window.current_usage then
    (.context_window.current_usage.input_tokens + .context_window.current_usage.output_tokens)
  else
    empty
  end
')

# Extract total tokens used in session
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens')
total_tokens=$((total_input + total_output))

# Calculate total usage percentage (based on context window size)
context_size=$(echo "$input" | jq -r '.context_window.context_window_size')
if [ -n "$context_size" ] && [ "$context_size" -gt 0 ]; then
  total_pct=$(awk "BEGIN {printf \"%.1f\", ($total_tokens / $context_size) * 100}")
else
  total_pct="0.0"
fi

# Build output
output="$model"

if [ -n "$used_pct" ]; then
  output="$output | Context: ${used_pct}%"
fi

if [ -n "$current_tokens" ]; then
  output="$output | Current: ${current_tokens} tokens"
fi

output="$output | Total: ${total_tokens} tokens (${total_pct}%)"

echo "$output"
