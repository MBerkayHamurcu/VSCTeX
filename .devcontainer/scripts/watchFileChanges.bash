#!/usr/bin/env bash

sleep 5

cd /workspaces/*/

filePath="frame/AUTOGEN_includeonly.tex"
autogenWarning="% This file is autogenerated. Do not edit it manually. Changes will be lost.\n"

inotifywait -m -e CLOSE_WRITE . |
while read -r file; do
  if [[ $file != *"indent.log" ]]; then
    continue
  fi

  fileName=$(cat indent.log | grep "Filename:" | awk '{print $NF}' | sed 's|/workspaces/[^/]*/||g' | sed 's/__latexindent_temp_//' | sed 's/.tex//')

  if [[ $fileName == *"AUTOGEN"* ]] ||
   { [[ $fileName != "content/"* ]] &&
     [[ $fileName != "appendix/"* ]]; } ||
    [[ $fileName == "config/"* ]] ||
    grep -wq "$fileName" <(sed -n -e 's#^\\includeonly{\(.*\)}#\1#p' "$filePath"); then
    continue
  fi

  includeonly=$(cat "$filePath" | grep -Po '(?<=\\includeonly{).*(?=})')

  echo -e "$autogenWarning" > frame/AUTOGEN_includeonly.tex

  if [ -z "$includeonly" ]; then
    includeonly="$fileName"
  else
    includeonly="$includeonly,$fileName"
  fi

  echo "\\includeonly{$includeonly}" >> frame/AUTOGEN_includeonly.tex
  echo "% lastChanges{$includeonly}" >> frame/AUTOGEN_includeonly.tex
done
