#!/usr/bin/env bash

filePath="config/locales"

# Check if the argument is a valid file
if [ ! -f "$filePath" ]; then
  echo "Please provide a valid text file as an argument."
  exit 1
fi

# Loop through each line of the file
while read -r line; do
  # Check if the line contains character and does not start with a '#'
  if [[ ! $line =~ ^$ ]] && [[ ! $line =~ ^# ]]; then
    selectedLocale="$line"
    break
  fi
done < "$filePath"

printf "\n## The following line was inserted from the setLocale.bash script\n%s.UTF-8 UTF-8\n" "$selectedLocale" >> /etc/locale.gen

# Generate default locale to bypass perl warning
locale-gen "en_US.UTF-8"

# Add configured locale
locale-gen

# Set configured locale
update-locale LC_ALL="$selectedLocale".UTF-8

selectedLocale=${selectedLocale//_/-}

bash .devcontainer/scripts/modifyUserSettings.bash ltex.language "$selectedLocale"

echo "Locale setup was successfull."
