#!/bin/sh

GODOT_VERSION="${1:-4.3}"
PLATFORM="${2:-windows}"
ENCRYPTION_KEY="$3"

TARGET="template_release"
ARCH="x86_64"

if [ ${#ENCRYPTION_KEY} -ne 64 ]; then
    echo "Invalid encryption key"
    exit 1
fi

/emsdk/emsdk activate latest
source /emsdk/emsdk_env.sh

if [ ! -d godot ]; then
    git clone -b "$GODOT_VERSION-stable" --single-branch https://github.com/godotengine/godot.git
fi

cd godot

# Ensure we don't include editor code in export template builds.
rm -rf editor

# Don't use LTO for now, windows build does not work
export SCRIPT_AES256_ENCRYPTION_KEY="$ENCRYPTION_KEY"
scons platform=$PLATFORM target=$TARGET arch=$ARCH tools=no debug_symbols=no \
    optimize=size \
    module_text_server_adv_enabled=no module_text_server_fb_enabled=yes # Use fallback text server
# lto=full 

cd ../

FILE="godot/bin/$(ls godot/bin -I '*.console.*' -I '*.js' -I '*.wasm' | grep $PLATFORM)"
EXT="${FILE##*.}"
TEMPLATE_FILE=custom_templates/$TARGET.$PLATFORM.$EXT
mkdir -p custom_templates

ls godot/bin
echo "Moving $FILE to $TEMPLATE_FILE"
mv $FILE $TEMPLATE_FILE
strip $TEMPLATE_FILE

echo "file=$TEMPLATE_FILE" >> $GITHUB_OUTPUT