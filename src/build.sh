#!/bin/bash -ex

echo "Cloning project to /garlicoin"
git clone https://github.com/garlicoin-project/garlicore-garlicoin.git /garlicoin

mkdir -p /output/linux_x86/

echo "Configuring build"
pushd /garlicoin
git checkout master
git pull
git describe

./autogen.sh
./configure --with-gui=no --disable-tests --disable-gui-tests --disable-shared --enable-cxx --disable-bench

echo "Starting compile"
make clean
make -j2

cp /garlicoin/src/garlicoind /output/linux_x86/
cp /garlicoin/src/garlicoin-cli /output/linux_x86/
cp /garlicoin/src/garlicoin-tx /output/linux_x86/

pushd /output/linux_x86/

./garlicoind --version

tar -cvzf garlicoin-0.16.0.2-x86_64-linux-gnu.tar.gz garlicoind garlicoin-cli

echo "Done!"
