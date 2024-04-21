sudo apt-get update -y
sudo apt-get full-upgrade -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.11 python3.11-venv -y
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 110
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 100
sudo update-alternatives --config python3
sudo apt-get install python3-pip -y
pip install poetry
echo Add path in ~/.bashrc to get rid of Pip path errors, if this is not already done. The path is export PATH="$HOME/.local/bin:$PATH"
wait 10
nano ~/.bashrc
source .bashrc
echo $PATH
poetry --version
git clone https://github.com/imartinez/privateGPT
cd privateGPT
python3 -m venv venv
source venv/bin/activate
poetry install --with ui,local
poetry run python scripts/setup
CMAKE_ARGS='-DLLAMA_CUBLAS=on' poetry run pip install --force-reinstall --no-cache-dir llama-cpp-python
PGPT_PROFILES=local make run


