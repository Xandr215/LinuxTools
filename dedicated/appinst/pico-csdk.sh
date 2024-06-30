git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
git submodule update --init
cd ..
git clone https://github.com/raspberrypi/pico-examples.git --branch master
cd pico-examples
mkdir build
cd build
export PICO_SDK_PATH=../../pico-sdk
cmake -DPICO_BOARD=pico_w -DWIFI_SSID="dexter" -DWIFI_PASSWORD="LittleManXander" ..
