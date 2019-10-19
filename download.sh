#! /bin/sh

rm -rf artifacts
rm -rf stage

mkdir artifacts
mkdir stage

cd artifacts

wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-0.1.6.tar.gz
wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.1.tar.gz
