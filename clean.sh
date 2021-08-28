#!/bin/bash

reset
export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64
export CROSS_COMPILE=$PWD/toolchain/gcc/linux-x86/aarch64/aarch64-gcc-4.9-brillo-m10-release/bin/aarch64-linux-android-

make O=$PWD/out mrproper
make O=$PWD/out clean
