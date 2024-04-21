path_bashrc() {
    local line_to_add='export PATH="$HOME/.local/bin:$PATH"'
    if ! grep -qxF "$line_to_add" ~/.bashrc; then
        # Append the line to ~/.bashrc
        echo "$line_to_add" >> ~/.bashrc
        echo "PATH line added to ~/.bashrc."
        # Source ~/.bashrc to apply changes immediately
        source ~/.bashrc
        echo "Changes applied."
    fi
}
sudo apt-get update -y
sudo apt-get full-upgrade -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get install python3.11 python3.11-venv -y
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 110
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 100
sudo update-alternatives --config python3
sudo apt-get install python3-pip -y
path_bashrc
pip install poetry
poetry --version
git clone https://github.com/imartinez/privateGPT
cd privateGPT
python3 -m venv venv
source venv/bin/activate
poetry install --with ui,local
poetry run python scripts/setup
CMAKE_ARGS='-DLLAMA_CUBLAS=on' poetry run pip install --force-reinstall --no-cache-dir llama-cpp-python
PGPT_PROFILES=local make run


