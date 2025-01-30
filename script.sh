#!/bin/bash

# GitHub username and Personal Access Token
USER="tanay13"
TOKEN=""

# Fetch all events (public and private)
events=$(curl -s -H "Authorization: Bearer $TOKEN" \
  "https://api.github.com/users/${USER}/hovercard")

# Print the events
echo "$events"
echo "$events" | jq -r '.[] | {type: .type, created_at: .created_at, repo: .repo.name, payload: .payload.action}'
