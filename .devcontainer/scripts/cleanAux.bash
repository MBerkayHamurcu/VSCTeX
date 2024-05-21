#!/bin/bash

regex=".*\.\(aux\|bbl\|bcf\|blg\|fdb_latexmk\|fls\|lof\|log\|lol\|lolistedEquation\|lot\|out\|run.xml\|tdo\|toc\)$"

filesList=$(find . ! -path "./.git/*" -type f -regex "$regex" -print)

if [ -n "$filesList" ]; then
  echo "$filesList"
  echo "The files listed above will be deleted."

  echo "$filesList" | xargs rm
fi

rm -r auxiliary 2>/dev/null
rm -rf `biber --cache`

echo "Cleaning auxiliary files was successfull."
