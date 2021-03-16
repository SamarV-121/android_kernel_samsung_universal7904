#!/bin/bash

green="\033[01;32m"
nocol="\033[0m"

export KBUILD_BUILD_USER="SamarV-121"
export CROSS_COMPILE="$HOME/toolchains/arm64-gcc-4.9/bin/aarch64-linux-android-"
export CROSS_COMPILE_ARM32="$HOME/toolchains/arm32-gcc-4.9/bin/arm-linux-androideabi-"
DEVICES=(m20lte m30lte a30 a30s a40)
KERNEL_DIR="$PWD"
KERNEL_IMAGE="$KERNEL_DIR/out/arch/arm64/boot/Image"
AK3_DIR="$HOME/tools/AnyKernel"
ZIPNAME="FuseKernel-test-$(git rev-parse --short HEAD)-$(date -u +%Y%m%d_%H%M)-universal7904.zip"

[ -e "$HOME/toolchains/arm64-gcc-4.9" ] || git clone --depth=1 https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 "$HOME/toolchains/arm64-gcc-4.9"
[ -e "$HOME/toolchains/arm32-gcc-4.9" ] || git clone --depth=1 https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 "$HOME/toolchains/arm32-gcc-4.9"
[ -e "$AK3_DIR" ] || git clone --depth=1 https://github.com/osm0sis/AnyKernel3 "$AK3_DIR"

git -C "$AK3_DIR" reset --hard && git -C "$AK3_DIR" clean -df && curl -s https://gist.githubusercontent.com/SamarV-121/24aecb5e1fad9ca5dcfa6bb86a2f9cda/raw >"$AK3_DIR/anykernel.sh"

for DEVICE in "${DEVICES[@]}"; do

	make "${DEVICE}_defconfig" O=out
	echo -e "${green}Compiling kernel for ${DEVICE}${nocol}"
	make -j "$(nproc)" O=out 2>&1 | tee build_"$DEVICE".log
	[ -e "$KERNEL_IMAGE" ] && cp -f "$KERNEL_IMAGE" "$AK3_DIR/Image_$DEVICE" && rm "$KERNEL_IMAGE" || exit 1

	echo -e "${green}Compiling kernel for ${DEVICE}-oneui${nocol}"
	make -j "$(nproc)" O=out \
		CONFIG_USB_ANDROID_SAMSUNG_MTP=y 2>&1 | tee build_"$DEVICE".log
	[ -e "$KERNEL_IMAGE" ] && cp -f "$KERNEL_IMAGE" "$AK3_DIR/Image_$DEVICE-oneui" && rm "$KERNEL_IMAGE" || exit 1

done

cd "$AK3_DIR"
zip -r "$ZIPNAME" *
