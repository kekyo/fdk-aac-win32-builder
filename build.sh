#! /bin/sh

###################################
# Compiler optimization flags:

# Platform native (not include AVX-512, it's standard options)
CFLAGS="-O3 -flto -march=native"

# AVX-512
#CFLAGS="-O3 -flto -march=native -mavx512f -mavx512dq -mavx512er -mavx512cd -mavx512bw -mavx512pf -mavx512vl -mavx512ifma -mavx512vbmi"

# For debugging/reference usage
#CFLAGS="-O0"

###################################

if [ -z "$MINGW_CHOST" ]; then
    echo "Building failed, because maybe you did not use MinGW terminal instead MSYS terminal."
    echo "See README.md how to use instructions."
    exit
fi

cd stage

rm -rf $MINGW_CHOST
mkdir $MINGW_CHOST
cd $MINGW_CHOST

tar -zxvf ../../artifacts/fdk-aac-0.1.6.tar.gz
#tar -zxvf ../../artifacts/fdk-aac-2.0.1.tar.gz
tar -zxvf ../../artifacts/fdk-aac-2.0.2.tar.gz
tar -zxvf ../../artifacts/fdkaac-1.0.0.tar.gz

cd fdk-aac-0.1.6
CC="gcc -pipe -static-libgcc" CXX="g++ -pipe -static-libgcc" ./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/ CFLAGS="${CFLAGS}"
make -j8
make install
cd ..

#cd fdk-aac-2.0.1
cd fdk-aac-2.0.1
CC="gcc -pipe -static-libgcc" CXX="g++ -pipe -static-libgcc" ./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/ CFLAGS="${CFLAGS}"
make -j8
make install
cd ..

cd fdkaac-1.0.0
autoreconf -i
CC="gcc -pipe -static-libgcc" CXX="g++ -pipe -static-libgcc" ./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/ CFLAGS="${CFLAGS}"
make -j8
make install
cd ..

cd ../..

rm -rf artifacts/$MINGW_CHOST
mkdir artifacts/$MINGW_CHOST
cd artifacts/$MINGW_CHOST

cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac.a libfdk-aac-1.a
cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac.dll.a libfdk-aac-1.dll.a
cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac-1.dll .

#cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac.a libfdk-aac-2.a
#cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac.dll.a libfdk-aac-2.dll.a
#cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac-2.dll .
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.2/.libs/libfdk-aac.a libfdk-aac-2.a
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.2/.libs/libfdk-aac.dll.a libfdk-aac-2.dll.a
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.2/.libs/libfdk-aac-2.dll .

cp ../../stage/$MINGW_CHOST/fdkaac-1.0.0/fdkaac.exe .
