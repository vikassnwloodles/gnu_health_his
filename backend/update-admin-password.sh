#!/bin/bash

set -e
set -o pipefail
trap 'echo -e "\n❌ An error occurred on line $LINENO. Please fix and rerun the script."; exit 1' ERR

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $SCRIPT_DIR


# === Load .env config ===
ENV_FILE=".env"
if [ -f "$ENV_FILE" ]; then
  set -o allexport
  source "$ENV_FILE"
  set +o allexport
else
  echo "❌ .env file not found."
  echo "Make sure you have a '.env' file at '$SCRIPT_DIR' with a 'DB_NAME' variable."
  exit 1
fi


# === Validate required env vars ===
REQUIRED_VARS=("DB_NAME")
for var in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    echo "❌ Missing required variable: $var"
    echo "💡 Please add '$var=...' to your .env file."
    exit 1
  fi
done



# === Initialize GNU Health database ===
source "$HOME/.gnuhealthrc"
TRYTOND_BIN_DIR="$HOME/gnuhealth/tryton/server/$(ls -1d ${HOME}/gnuhealth/tryton/server/trytond-* | grep -o 'trytond-[0-9.]\+' | sort -V | tail -1)/bin"
cd "$TRYTOND_BIN_DIR"
python3 ./trytond-admin --all --database="$DB_NAME" --password
echo "✅ Password updated successfully."
