#!/bin/bash

# Match files that start with a digit
for CHAPTER in $(find content -mindepth 2 -name "[0-9]*.tex")
do
    echo "\\input{$CHAPTER}"
done >content/AUTOGEN_contentCollection.tex
