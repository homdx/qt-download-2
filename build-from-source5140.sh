#!/bin/bash

#cd /Qt5140
#ls -la /qt514-beta2.tar.gz
#time tar -xf qt514-beta2.tar.gz && time rm qt514-beta2.tar.gz && date
#mv Qt514/ Qt

export QT_VERSION=5.14.0
echo QT version is $QT_VERSION
echo show envs in build script
set
export PATH="/Qt5140/Qt/$QT_VERSION/android_armv7/bin/:${PATH}"
echo show new envs in build script
set
export QT_HOME=/Qt5140/Qt/$QT_VERSION/
echo search whereis
whereis qmake

apt install build-essential g++ -y && \
apt-get install gcc git bison python gperf pkg-config gdb-multiarch -y && \
apt-get install libgles2-mesa-dev -y && \
export NDK_VERSION=r20 && \
export    ANDROID_NDK_ARCH=arch-arm c && \
export    ANDROID_NDK_EABI=llvm c && \
export    ANDROID_NDK_HOST=linux-x86_64 c && \
export    ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi c && \
export    ANDROID_NDK_TOOLCHAIN_VERSION=4.9 c && \
export DEBIAN_FRONTEND=noninteractive c && \
cd /Qt5140/Qt/5.14.0/Src && echo start build && date && LANG=C ./configure -android-arch armeabi-v7a -opensource -confirm-license -release -nomake tests -nomake examples -no-compile-examples -android-sdk /android-sdk-linux -android-ndk /android-ndk-r20 -xplatform android-clang -no-warnings-are-errors --disable-rpath \
-openssl -I /android_openssl/openssl-1.1.1d/include -L /android_openssl/arm && \
&& make --no-print-directory && echo end build && date && echo build done && make install && cd /Qt5140/Qt/5.14.0/Src/qtbase/src/tools/androiddeployqt && make && make install &&  echo done1 && date && echo rm -rf /Qt && date && echo all done ok || echo error build
