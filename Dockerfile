FROM fedora

ARG NDK_VERSION=r20
ARG SDK_INSTALL_PARAMS=platform-tool,build-tools-28.0.2,android-21

RUN dnf update -y && dnf install clang unzip wget time java-1.8.0-openjdk aria2 which -y

#COPY install-android-sdk /tmp/install-android-sdk
RUN JAVA_HOME=$(dirname $( readlink -f $(which java) )) \
   && JAVA_HOME=$(realpath "$JAVA_HOME"/../) \
   && export JAVA_HOME && echo $JAVA_HOME \
   && wget https://raw.githubusercontent.com/homdx/qtci/513/bin/install-android-sdk --directory-prefix=/tmp \
	&&  chmod u+rx /tmp/install-android-sdk \
   && /tmp/install-android-sdk $SDK_INSTALL_PARAMS

RUN apt-get install time aria2 -y && mkdir /Qt5140 && cd /Qt5140 && \
    aria2c -x10 -k1M https://github.com/homdx/qt-download-2/releases/download/3/qt514.aa && \
    echo curl -SL https://github.com/homdx/qt-download-2/releases/download/3/qt514.aa -o qt514.aa && \
    aria2c -x10 -k1M https://github.com/homdx/qt-download-2/releases/download/3/qt514.ab && \
    aria2c -x10 -k1M https://github.com/homdx/qt-download-2/releases/download/3/qt514.ac && \
    echo curl -SL https://github.com/homdx/qt-download-2/releases/download/3/qt514.ab -o qt514.ab && \
    echo curl -SL https://github.com/homdx/qt-download-2/releases/download/3/qt514.ac -o qt514.ac && \
    cat qt514.?? > qt-5140.tar.gz && rm -vf qt514.*  && \
    set -ex && echo "${ADBCACHE_HASH1}  qt-5140.tar.gz" | sha512sum -c  && \
    time tar -xf qt-5140.tar.gz && time rm qt-5140.tar.gz && date && cd /Qt5140 && mv Qt514/ Qt && ls /
 
RUN tail -f /var/log/faillog
