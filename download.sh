#! /bin/sh

rm -rf artifacts
rm -rf stage

mkdir artifacts
mkdir stage

cd artifacts

wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-0.1.6.tar.gz
wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.1.tar.gz
wget https://github.com/nu774/fdkaac/archive/1.0.0.tar.gz

mv 1.0.0.tar.gz fdkaac-1.0.0.tar.gz
