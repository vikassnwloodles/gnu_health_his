PYTHON_VERSION=3.12.3
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "⏳ Installing System requirements..."
sudo apt update
sudo apt install libcairo2-dev -y
sudo apt install libgirepository1.0-dev -y
echo -e "✅ System requirements installed successfully!\n"

# Delete existing virtual environment directory before creating a new one
rm -rf "$SCRIPT_DIR/env"

if [ -d "env" ]; then
    echo "⏳ Activating virtual environment..."
    source env/bin/activate
    echo -e "✅ Virtual environment activated successfully!\n"
else
    # === Install pyenv if not already present ===
    if [ ! -d "$HOME/.pyenv" ]; then
    echo -e "\n\n📦 Installing pyenv..."
    curl https://pyenv.run | bash
    fi

    # === Set up pyenv for current shell ===
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    # === Persist pyenv config ===
    if ! grep -q 'PYENV_ROOT' "$HOME/.bashrc"; then
    echo -e "\n# Pyenv setup" >> "$HOME/.bashrc"
    {
        echo 'export PYENV_ROOT="$HOME/.pyenv"'
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"'
        echo 'eval "$(pyenv init --path)"'
        echo 'eval "$(pyenv init -)"'
    } >> "$HOME/.bashrc"
    fi

    # === Install Python version if not installed ===
    if ! pyenv versions --bare | grep -qx "$PYTHON_VERSION"; then
    echo -e "\n\n🐍 Installing Python $PYTHON_VERSION..."
    pyenv install "$PYTHON_VERSION"
    fi

    echo "⏳ Creating virtual environment..."
    pyenv local $PYTHON_VERSION
    python3 -m venv env
    echo -e "✅ Virtual environment created successfully!\n"
    echo "⏳ Activating virtual environment..."
    source env/bin/activate
    echo -e "✅ Virtual environment activated successfully!\n"
fi

echo "⏳ Installing Python requirements..."
pip install -r requirements.txt
echo -e "✅ Python requirements installed successfully!\n"


echo -e "\n\n✅ GNU Health GUI Client setup successfully!"
