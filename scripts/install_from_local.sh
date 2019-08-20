#!/bin/bash
set -euo pipefail

if [[ -d dist ]]; then
	J2OBJC_VERSION=$(cat dist/VERSION 2>&1)
	echo "J2Objc header files are already installed. Version: $J2OBJC_VERSION"
	exit
fi

J2OBJC_VERSION=$($J2OBJC_HOME/j2objc -version 2>&1)
echo "Found J2OBJC version: $J2OBJC_VERSION"

echo "Copying files ..."
mkdir dist
cp -r  $J2OBJC_HOME/include \
    $J2OBJC_HOME/lib \
    $J2OBJC_HOME/frameworks \
    $J2OBJC_HOME/j2objc \
    $J2OBJC_HOME/j2objcc \
    dist

touch dist/VERSION
echo $J2OBJC_VERSION > dist/VERSION
echo "Done."
