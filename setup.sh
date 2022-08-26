#! /bin/sh

if [ -z "$MINGW_CHOST" ]; then
    echo "Setup failed because maybe you did not use MinGW terminal instead MSYS terminal."
    echo "See README.md how to use instructions."
    exit
fi

rm -rf artifacts
rm -rf stage

mkdir artifacts
mkdir stage

cd artifacts

wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdk-aac-0.1.6.tar.gz
wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdk-aac-2.0.2.tar.gz
#wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdkaac-1.0.2.tar.gz
wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdkaac-1.0.3.tar.gz

cd ..
