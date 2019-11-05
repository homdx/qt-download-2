FROM fedora

ARG NDK_VERSION=r20
ARG SDK_INSTALL_PARAMS=platform-tool,build-tools-28.0.2,android-21
ARG ANDROID_SDK_ROOT=/android-sdk-linux
ARG ADBCACHE_HASH1=0ccf3272db15fb9520e75ff584b784a7d02ac3630b66b7cdadc6b741c7fe8cfac52124e09eb876e2da319763e4dcdef3496b56ddaac9af700d268f565ca71bad

RUN dnf update -y && dnf install clang unzip wget time java-1.8.0-openjdk java-1.8.0-openjdk-devel aria2 which patch git make -y

#COPY install-android-sdk /tmp/install-android-sdk
RUN JAVA_HOME=$(dirname $( readlink -f $(which java) )) \
   && JAVA_HOME=$(realpath "$JAVA_HOME"/../) \
   && export JAVA_HOME && echo $JAVA_HOME \
   && wget https://raw.githubusercontent.com/homdx/qtci/513/bin/install-android-sdk --directory-prefix=/tmp \
    &&  chmod u+rx /tmp/install-android-sdk \
   && /tmp/install-android-sdk $SDK_INSTALL_PARAMS

RUN mkdir /Qt5140 && cd /Qt5140 && \
    aria2c -x10 -k1M https://github.com/homdx/qt-download-2/releases/download/3/qt514.aa && \
    echo curl -SL https://github.com/homdx/qt-download-2/releases/download/3/qt514.aa -o qt514.aa && \
    aria2c -x10 -k1M https://github.com/homdx/qt-download-2/releases/download/3/qt514.ab && \
    aria2c -x10 -k1M https://github.com/homdx/qt-download-2/releases/download/3/qt514.ac && \
    echo curl -SL https://github.com/homdx/qt-download-2/releases/download/3/qt514.ab -o qt514.ab && \
    echo curl -SL https://github.com/homdx/qt-download-2/releases/download/3/qt514.ac -o qt514.ac && \
    cat qt514.?? > qt-5140.tar.gz && rm -vf qt514.*  && \
    set -ex && echo "${ADBCACHE_HASH1}  qt-5140.tar.gz" | sha512sum -c  && \
    time tar -xf qt-5140.tar.gz && time rm qt-5140.tar.gz && date && cd /Qt5140 && mv Qt514/ Qt && ls /

COPY build-from-source5140.sh /

#&& cd / && git clone https://github.com/homdx/android_openssl.git && cd /android_openssl && echo git checkout master

RUN cd /android-sdk-linux/tools/bin/ && ./sdkmanager "platforms;android-21" && cd / && git clone https://github.com/homdx/android_openssl.git  && \
mkdir ~/android && ln -s /android-ndk-r20 ~/android/ndk-bundle && cd /android_openssl && echo time ./build_ssl.sh

#COPY ssl.patch /android_openssl/ssl.patch

RUN echo build OpenSSL from sources && \
export NDK_VERSION=r20 && \
export    ANDROID_NDK_ARCH=arch-arm c && \
export    ANDROID_NDK_EABI=llvm c && \
export    ANDROID_NDK_HOST=linux-x86_64 c && \
export    ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi c && \
export    ANDROID_NDK_TOOLCHAIN_VERSION=4.9 c && \
export DEBIAN_FRONTEND=noninteractive c && \
export ANDROID_NDK_HOME=/android-ndk-r20 && \
cd /android_openssl/ && git checkout 5140  && echo patch -p0 ssl.patch && echo start build ssl && date && time ./build_ssl.sh && date && echo build done && \
ls -la arm

RUN cd /android-sdk-linux/tools/bin && ./sdkmanager "build-tools;29.0.2" && time /build-from-source5140.sh && echo build all done || echo error build
CMD tail -f /bin/true
