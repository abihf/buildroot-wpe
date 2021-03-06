#!/bin/sh

BOARD_DIR="$(dirname $0)"

echo "Updating the zImage to load the device tree"
${HOST_DIR}/usr/bin/mkknlimg ${BINARIES_DIR}/zImage ${BINARIES_DIR}/zImage-dt

echo "Updating the config and cmdline files"
cp -af ${BOARD_DIR}/config-eakses.txt ${BINARIES_DIR}/rpi-firmware/config.txt
cp -af ${BOARD_DIR}/cmdline.txt ${BINARIES_DIR}/rpi-firmware/cmdline.txt
