
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

ARG QT_VERSION=5.13.1
ARG NDK_VERSION=r19c
ARG ANDROID_SDK_ROOT=/android-sdk-linux

ARG PATH="/Qt/$QT_VERSION/android_armv7/bin/:${PATH}"
ARG ANDROID_NDK_ROOT="/android-ndk-$NDK_VERSION"
ARG ANDROID_SDK_ROOT="/android-sdk-linux"
ARG QT_HOME=/Qt/$QT_VERSION/

#tar -czvf /make.tar.gz `find ./ -name Makefile`
#ADD make.tar.gz /Qt/$QT_VERSION/Src
COPY ssl.patch /android_openssl/ssl.patch
RUN echo build OpenSSL from sources && \
export NDK_VERSION=r19c && \
export    ANDROID_NDK_ARCH=arch-arm c && \
export    ANDROID_NDK_EABI=llvm c && \
export    ANDROID_NDK_HOST=linux-x86_64 c && \
export    ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi c && \
export    ANDROID_NDK_TOOLCHAIN_VERSION=4.9 c && \
export DEBIAN_FRONTEND=noninteractive c && \
export ANDROID_NDK_HOME=/android-ndk-r19c && \
apt install build-essential g++ -y && \
apt-get install gcc git bison python gperf pkg-config gdb-multiarch -y && \
apt-get install libgles2-mesa-dev time -y && \
cd /android_openssl/ && git checkout master && patch -p0 <ssl.patch && echo start build ssl && date && time ./build_ssl.sh && date && echo build done && \
apt-get remove build-essential g++ gcc git bison python gperf pkg-config gdb-multiarch libgles2-mesa-dev time -y && apt-get clean &&  echo clean up done && \
ls -la arm


RUN apt-get clean && apt install build-essential g++ -y && \
apt-get install gcc git bison python gperf pkg-config gdb-multiarch -y && \
apt-get install libgles2-mesa-dev time -y && \
export NDK_VERSION=r19c && \
export    ANDROID_NDK_ARCH=arch-arm c && \
export    ANDROID_NDK_EABI=llvm c && \ 
export    ANDROID_NDK_HOST=linux-x86_64 c && \
export    ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi c && \
export    ANDROID_NDK_TOOLCHAIN_VERSION=4.9 c && \
export DEBIAN_FRONTEND=noninteractive c && \
cd /Qt/${QT_VERSION}/Src && echo start build && date && echo search make && whereis make && echo search qmake && whereis qmake && echo configure && ls -la && set +ex && git init && \
git config --global user.email "you@example.com" && \
git config --global user.name "Your Name" && \
date >/1.txt && git add . && date >>/1.txt && git commit -m 'initial' --quiet && echo git init done >>/1.txt && date >>/1.txt && ./configure -android-arch armeabi-v7a -opensource -confirm-license -release -nomake tests -nomake examples -no-compile-examples -android-sdk /android-sdk-linux -android-ndk /android-ndk-r19c -xplatform android-clang -no-warnings-are-errors --disable-rpath --recheck -openssl -I /android_openssl/openssl-1.1.1c/include -L /android_openssl/arm -openssl-linked  && echo configure done && \
git add . && git commit -m 'configure' --quiet && echo 'done commit configure' >>/1.txt && echo done commit configure && date >>/1.txt && echo time tar -czf /app/git.tar.gz .git/ && echo done tar >>/1.txt && echo done tar && date >>/1.txt && \
cd /Qt/${QT_VERSION}/Src && echo wget git && wget --quiet https://github.com/homdx/qt-download-2/releases/download/git-src1/gt-git.tar.gz && \
echo rm -rf .git && \
echo tar -xf gt-git.tar.gz && rm gt-git.tar.gz && echo list dir && ls -la && echo list git dir && ls -la .git && echo git reset --hard && git status && echo start for build && \
date >/1.txt && echo start build>>/1.txt && \
#git config --global user.email "you@example.com" && \
#git config --global user.name "Your Name" && \
make -j `grep -c '^processor' /proc/cpuinfo` -s && echo end build && date && date >>/1.txt && git add . && git commit -m 'compiled' --quiet && \
echo commited >>/1.txt && date >>/1.txt && \
time tar -czf /app/git.tar.gz .git/ && echo done tar >>/1.txt && echo done tar && date >>/1.txt

RUN mkdir -p /usr/local/Qt-5.13.1/android_armv7 && ln -s /usr/local/Qt-5.13.1/bin /usr/local/Qt-5.13.1/android_armv7/bin

ARG QT_VERSION=5.13.1
ENV PATH="/usr/local/5.13.1/android_armv7/bin/:${PATH}"
ENV QT_HOME=/usr/local/Qt-5.13.1/
ENV NDK_VERSION=r19c
ENV ANDROID_NDK_ARCH="arch-arm c"
ENV ANDROID_NDK_EABI="llvm c"
ENV ANDROID_NDK_HOST="linux-x86_64 c"
ENV ANDROID_NDK_TOOLCHAIN_PREFIX="arm-linux-androideabi c"
ENV ANDROID_NDK_TOOLCHAIN_VERSION="4.9 c"
ENV DEBIAN_FRONTEND="noninteractive c"
ENV ANDROID_NDK_HOME=/android-ndk-r19c

CMD tail -f /var/log/faillog

