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

# wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-0.1.6.tar.gz
# wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.1.tar.gz
# wget https://github.com/nu774/fdkaac/archive/1.0.0.tar.gz

# mv 1.0.0.tar.gz fdkaac-1.0.0.tar.gz

wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdk-aac-0.1.6.tar.gz
wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdk-aac-2.0.1.tar.gz
wget https://github.com/kekyo/fdk-aac-win32-builder/releases/download/distributes/fdkaac-1.0.0.tar.gz

cd ..
