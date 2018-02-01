#!/bin/bash -ex

echo "Cloning project to /garlicoin"
git clone https://github.com/garlicoin-project/garlicore-garlicoin.git /garlicoin

mkdir -p /output/linux_x86/

echo "Configuring build"
pushd /garlicoin
./autogen.sh
./configure --with-gui=no --disable-tests --disable-gui-tests

echo "Starting compile"
make clean
make

cp /garlicoin/src/garlicoind /output/linux_x86/
cp /garlicoin/src/garlicoin-cli /output/linux_x86/
cp /garlicoin/src/garlicoin-tx /output/linux_x86/

echo "Done!"