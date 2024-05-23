#!/bin/bash

filename="frame/AUTOGEN_includeonly.tex"

# Read the file
file_content=$(cat "$filename")

# Extract the content inside lastChanges{}
last_changes_content=$(echo "$file_content" | grep -oP 'lastChanges\{\K[^}]+' )

# Escape the last_changes_content
last_changes_content=$(echo "$last_changes_content" | sed 's/[]\/$*.^|[]/\\&/g')

includeonly=$(cat frame/AUTOGEN_includeonly.tex | grep -Po '(?<=\\includeonly{).*(?=})')
if [ -z "$includeonly" ]; then
    echo "Copying lastChanges content into \\includeonly"
    sed -i "s/\\includeonly{}/\\includeonly{$last_changes_content}/" "$filename"
fi
