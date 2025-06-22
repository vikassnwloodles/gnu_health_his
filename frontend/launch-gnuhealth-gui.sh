SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Launch GNU Health GUI"
$SCRIPT_DIR/env/bin/gnuhealth-client
