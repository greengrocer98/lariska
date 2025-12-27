#!/usr/bin/env bash

set -euxo pipefail

# Requirements:
# 1. https://zmk.dev/docs/development/setup
# 2. checkout zmk repo to feat/pointers-move-scroll on petejohansson's repo


build () {
    local shield=lariska
    export ZMK_PAW_3395="$HOME/zmk_modules/ggrocer-zmk-paw3395-driver"
    export ZMK_RGBLED_WIDGET="$HOME/zmk_modules/zmk-vfx-rgbled-indicator"
    export ZMK_MODULE_DIRS="${ZMK_PAW_3395};${ZMK_RGBLED_WIDGET}"
    rm -rf $CURRENT_DIR/build/$shield
    west build \
        -p -b nice_nano \
        -S studio-rpc-usb-uart \
        -S zmk-usb-logging \
        -d "$CURRENT_DIR/build/$shield" -- \
        -DZMK_CONFIG="$CURRENT_DIR" \
        -DZMK_EXTRA_MODULES="${ZMK_MODULE_DIRS}" \
        -DSHIELD=$shield

    cp "$CURRENT_DIR/build/$shield/zephyr/zmk.uf2" "$CURRENT_DIR/build/$shield/$shield.uf2"
    cp "$CURRENT_DIR/build/$shield/zephyr/zmk.uf2" "$CURRENT_DIR/build/uf_files/$shield.uf2"
}

build_reset () {
    rm -rf $CURRENT_DIR/build/reset
    west build \
        -p -b nice_nano \
        -S studio-rpc-usb-uart \
        -d "$CURRENT_DIR/build/reset" -- \
        -DZMK_CONFIG="$CURRENT_DIR" \
        -DSHIELD=settings_reset

    cp "$CURRENT_DIR/build/reset/zephyr/zmk.uf2" "$CURRENT_DIR/build/reset/reset.uf2"
}

CURRENT_DIR="$(pwd)"

DEFAULTZMKAPPDIR="$HOME/zmk_new/"
ZMK_APP_DIR="$DEFAULTZMKAPPDIR/app"

cd $DEFAULTZMKAPPDIR && source .venv/bin/activate && cd -

mkdir -p $CURRENT_DIR/build
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR="$HOME/zephyr-sdk-0.17.0"

pushd $ZMK_APP_DIR

# build
build_reset

deactivate

popd
