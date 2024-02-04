# Credit to: https://gist.github.com/Nezteb/9eb91294e0ad8dc12fc03f6863023e09

# Usage: modifyUserSettings.bash <key> [<value>]
SETTINGS_DIR="/root/.vscode-server/data/Machine"
FILE="$SETTINGS_DIR/settings.json"

KEY=$1
VALUE=$2

if ! command -v jq &> /dev/null; then
  echo -e "ERROR\n\tjq must be installed to process JSON"
  exit 1
fi

if [ -z "$KEY" ]; then
  echo -e "ERROR\n\tUsage: codeSettings <key> [<value>]"
  exit 1
fi

# Validate JSON first
if ! jq . < "$FILE" &> /dev/null; then
  echo -e "ERROR\n\tInvalid JSON in $FILE"
  exit 1
fi

KEY_VALUE=$(jq ".\"$KEY\"" < "$FILE")

if [ "$KEY_VALUE" = "null" ]; then
  echo "Key does not exist: \"$KEY\""
else
  echo -e "Key exists:\n\t\"$KEY\": $KEY_VALUE"
fi

if [ "$KEY_VALUE" = "\"$VALUE\"" ]; then
  echo "Key already has desired value, skipping"
elif [ "$VALUE" != "" ]; then
  # Backup file (you'll have to delete backup manually)
  cp "$FILE" "$FILE.bak"
  
  echo -e "Adding value to key:\n\t\"$KEY\": \"$VALUE\""
  jq ". += { \"$KEY\": \"$VALUE\" }" < "$FILE" > "$FILE.tmp"
  mv "$FILE.tmp" "$FILE"
fi
