#! /bin/sh

cd stage

rm -rf $MINGW_CHOST
mkdir $MINGW_CHOST
cd $MINGW_CHOST

tar -zxvf ../../artifacts/fdk-aac-0.1.6.tar.gz
tar -zxvf ../../artifacts/fdk-aac-2.0.1.tar.gz
tar -zxvf ../../artifacts/fdkaac-1.0.0.tar.gz

cd fdk-aac-0.1.6
./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/
make -j40
make install
cd ..

cd fdk-aac-2.0.1
./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/
make -j40
make install
cd ..

cd fdkaac-1.0.0
autoreconf -i
./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/
make -j40
make install
cd ..

cd ../..

rm -rf artifacts/$MINGW_CHOST
mkdir artifacts/$MINGW_CHOST
cd artifacts/$MINGW_CHOST

cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac.a libfdk-aac-1.a
cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac.dll.a libfdk-aac-1.dll.a
cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac-1.dll .

cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac.a libfdk-aac-2.a
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac.dll.a libfdk-aac-2.dll.a
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac-2.dll .

cp ../../stage/$MINGW_CHOST/fdkaac-1.0.0/fdkaac.exe .

if [ -e $MINGW_PREFIX/bin/libgcc_s_dw2-1.dll ]; then
    cp $MINGW_PREFIX/bin/libgcc_s_dw2-1.dll .
    cp $MINGW_PREFIX/bin/libwinpthread-1.dll .
fi
