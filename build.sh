#!/bin/bash
cp src/js/main.js ./build
cp src/index.html ./build
cp src/shaders/* ./build/assets
cp models/* ./build/assets
em++ src/cpp/renderer.cpp src/cpp/projection/camera.cpp --preload-file build/assets@/ -std=c++11 -s WASM=1 -s USE_SDL=2 --bind -O3 -s EXPORT_ALL=1 -s BINARYEN_TRAP_MODE='clamp' -s TOTAL_MEMORY=1500MB -I include -o build/renderer.js