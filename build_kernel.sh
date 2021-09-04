#!/bin/bash


export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64


make ARCH=arm64 O=../out mrproper
make ARCH=arm64 O=../out exynos9810-r7_defconfig
make ARCH=arm64 O=../out -j$(nproc --all)
