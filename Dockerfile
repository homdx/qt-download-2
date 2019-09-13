FROM homdx/qt-android-docker:5.13.1
#Mirror
#FROM quay.io/homdx/qt-android-docker:513

ARG ADBCACHE_VERSION=1
ARG ADBCACHE_HASH=96f8bd9afd275ce9aa81c45e89c79db97155861df6665e508ff64e40b96a323e602578976d8256241993a239d3d1bc9648979bf12c91864140c5a9164c42c3b9
ARG ADBCACHEFILE=android.tar.gz

RUN cd /root && set -ex && curl -s -L -o android.tar.gz https://github.com/homdx/qt-download-2/releases/download/${ADBCACHE_VERSION}/${ADBCACHEFILE} \
    && echo "${ADBCACHE_HASH}  android.tar.gz" | sha512sum -c \
    && tar -xvf android.tar.gz \
    && ls -la android.tar.gz && rm android.tar.gz && cd ..
ARG NDKVER=r19c
ARG projname=qt-download-2
ARG profile=qt-download-2.pro

RUN cat /usr/bin/build-android-gradle-project && cd / && git clone https://github.com/homdx/android_openssl.git && cd /android_openssl && echo git checkout 5.12.4_5.13.0 && mkdir -pv /app/${projname}

ADD . /app/${projname}/

WORKDIR /app/${projname}/src

RUN ls -la /android-sdk-linux && yes | /android-sdk-linux/tools/bin/sdkmanager --licenses && \
    export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run && cp -vf ${profile}.buildapk ${profile} && \
    echo update translate files && lrelease ${profile} && \
    build-android-gradle-project ${profile} --debug && \
    echo copy result apk && \
    cp -vf android-build/build/outputs/apk/debug/android-build-debug.apk /app || echo error build

RUN export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run && cp -vf ${profile}.buildapk ${profile} && \
    echo update translate files && lrelease ${profile} && \
    build-android-gradle-project ${profile} --debug && \
    echo copy result apk && \
    cp -vf android-build/build/outputs/apk/debug/android-build-debug.apk /app || echo error build

#COPY config.opt /Qt/5.13.1/config.opt

RUN apt install build-essential g++ -y && \
export NDK_VERSION=r19c && \
export    ANDROID_NDK_ARCH=arch-arm c && \
export    ANDROID_NDK_EABI=llvm c && \ 
export    ANDROID_NDK_HOST=linux-x86_64 c && \
export    ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi c && \
export    ANDROID_NDK_TOOLCHAIN_VERSION=4.9 c && \
export DEBIAN_FRONTEND=noninteractive c && \
cd /Qt/5.13.1/Src && ./configure -android-arch armeabi-v7a -opensource -confirm-license -release-nomake tests -nomake examples -no-compile-examples && \
make -j4 && echo build done && echo build done && make install || echo error build

CMD tail -f /var/log/faillog
