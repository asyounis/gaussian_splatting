#!/bin/bash

cd ../SIBR_viewers

rm -rf build

cmake -Bbuild . -DCMAKE_BUILD_TYPE=Debug
# cmake -Bbuild . -DCMAKE_BUILD_TYPE=Release
cmake --build build -j --target install
