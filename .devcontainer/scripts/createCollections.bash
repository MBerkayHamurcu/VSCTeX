#!/bin/bash

# Content Collection
# Match .tex files that are not named "abstract.tex" or start with "AUTOGEN"
for CONTENT in $(find content -name "*.tex" | grep -v "abstract.tex" | grep -v "AUTOGEN")
do
    echo "\\input{$CONTENT}"
done >content/AUTOGEN_contentCollection.tex

# Appendix Collection
for APPEND in $(find appendix -name "*.tex" | grep -v "AUTOGEN")
do
    echo "\\input{$APPEND}"
done >appendix/AUTOGEN_appendixCollection.tex
