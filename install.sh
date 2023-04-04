#https://lambda-it.ch/blog/build-opencv-js

apt install git cmake python libopenjp2-7 libopenjp2-7-dev libva-dev

git clone https://github.com/emscripten-core/emsdk.git
cd emsdk/
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh

git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

mkdir -p modules
mv opencv_contrib/modules/bioinspired modules