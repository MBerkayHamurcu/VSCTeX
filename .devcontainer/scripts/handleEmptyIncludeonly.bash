#!/bin/bash

filePath="frame/AUTOGEN_includeonly.tex"

# Read the file
file_content=$(cat "$filePath")

# Extract the content inside lastChanges{}
last_changes_content=$(echo "$file_content" | grep -oP 'lastChanges\{\K[^}]+' )

# Escape the last_changes_content
last_changes_content=$(echo "$last_changes_content" | sed 's/[]\/$*.^|[]/\\&/g')

includeonly=$(cat "$filePath" | grep -Po '(?<=\\includeonly{).*(?=})')

if [ -z "$includeonly" ]; then
    sed -i "s/\\includeonly{}/\\includeonly{$last_changes_content}/" "$filePath"
fi
