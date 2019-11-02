#FROM homdx/qt-android-docker:5.13.1
FROM homdx/qt-sources:001-slim

ARG ADBCACHE_VERSION=1.0.6
ARG ADBCACHE_HASH=f64ce7ec93b7dc78b0b3a0227a369604221c9bd2d54c33d1d3e1865d720a7351cc91a99008a4ea66ab799c8e76688f442bbc65c30255baae9497e9c67c6c5f0e
ARG ADBCACHEFILE=android.tar.gz

RUN cd /root && set -ex && curl -s -L -o android.tar.gz https://github.com/homdx/qt-view/releases/download/${ADBCACHE_VERSION}/${ADBCACHEFILE} \
    && echo "${ADBCACHE_HASH}  android.tar.gz" | sha512sum -c \
    && tar -xvf android.tar.gz \
    && ls -la android.tar.gz && cd ..

ARG NDKVER=r19c
ARG projname=qt-download-2
ARG profile=qt-download-2.pro

ARG LLVM_VERSION=9.0.0

RUN cd / && curl -SL http://releases.llvm.org/${LLVM_VERSION}/llvm-${LLVM_VERSION}.src.tar.xz  -o ${LLVM_VERSION}.tar.xz \
&& tar -xf ${LLVM_VERSION}.tar.xz && rm ${LLVM_VERSION}.tar.xz \
&& apt install cmake -y && cd llvm-${LLVM_VERSION}.src && mkdir build && cd build \
&& cmake .. && make -j1 && clang --version && make install && rm -rf /llvm-${LLVM_VERSION}.src && clang --version

ADD . /app/${projname}/

WORKDIR /app/${projname}/src

RUN set && export PATH=/usr/local/Qt-5.13.1/android_armv7/bin:$PATH && ls -la /android-sdk-linux && yes | /android-sdk-linux/tools/bin/sdkmanager --licenses && \
    export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run && cp -vf ${profile}.buildapk ${profile} && \
    echo update translate files && lrelease ${profile} && \
    rm -rvf android-build && \
    build-android-gradle-project ${profile} --debug && \
    echo copy result apk && \
    cp -vf android-build/build/outputs/apk/debug/android-build-debug.apk /app || echo error build

CMD tail -f /var/log/faillog
