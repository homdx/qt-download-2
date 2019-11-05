[![Build Status](https://travis-ci.org/homdx/qt-download-2.svg?branch=master)](https://travis-ci.org/homdx/qt-download-2)

*Docker image status*

[![Docker Repository on Quay](https://quay.io/repository/homdx/qt-download-2/status "Docker Repository on Quay")](https://quay.io/repository/homdx/qt-download-2)




Use modified submodule with debug messages:

```https://github.com/Larpon/QuickDownload```




**configuration**
```

This is the Qt Open Source Edition.

You have already accepted the terms of the Open Source license.

Running configuration tests...
Checking for valid makespec... yes
Checking for alloca() in alloca.h... yes
Checking for target architecture... arm64
Checking for host architecture... x86_64
Checking for C++14 support... yes
Checking for C++17 support... yes
Checking for C99 support... yes
Checking for C11 support... yes
Checking for pkg-config... no
Checking for dlopen()... yes
Checking for new dtags support... yes
Checking for udev... no
Checking for POSIX fallocate()... yes
Checking for precompiled header support... no
Checking for RDRAND instruction... no
Checking for symbol visibility support... yes
Checking for -Bsymbolic-functions support... no
Checking for Signaling NaN for doubles... yes
Checking for STL compatibility... yes
Checking for zlib... yes
Checking for Zstandard... no
Checking for clock_gettime()... yes
Checking for POSIX monotonic clock... yes
Checking for C++11 <future>... no
Checking for eventfd... yes
Checking for futimens()... yes
Checking for getauxval()... yes
Checking for getentropy()... no
Checking for GLib... no
Checking for GNU libc... no
Checking for ICU... no
Checking for inotify... yes
Checking for SysV IPC... no
Checking for POSIX IPC... no
Checking for ppoll()... yes
Checking for PCRE2... no
Checking for renameat2()... no
Checking for slog2... no
Checking for statx() in libc... no
Checking for 64 bit atomics... yes
Checking for DoubleConversion... no
Checking for O_CLOEXEC... yes
Checking for C++11 <random>... yes
Checking for working std::atomic for function pointers... yes
Checking for OpenSSL Headers... yes
Checking for DTLS support in OpenSSL... yes
Checking for getifaddrs()... no
Checking for KRB5 GSSAPI Support... no
Checking for IPv6 ifname... no
Checking for Linux AF_NETLINK sockets... yes
Checking for OpenSSL 1.1 support... yes
Checking for OCSP stapling support in OpenSSL... yes
Checking for xkbcommon >= 0.5.0... no
Checking for Desktop OpenGL... no
Checking for OpenGL ES 2.0... yes
Checking for KMS... no
Checking for EGL... yes
Checking for XLib... no
Checking for evdev... yes
Checking for FreeType... no
Checking for GBM... no
Checking for LinuxFB... no
Checking for mtdev... no
Checking for OpenGL ES 3.0... no
Checking for OpenVG... no
Checking for default QPA platform... android
Checking for HarfBuzz... no
Checking for libjpeg... no
Checking for libpng... no
Checking for libmd4c... no
Checking for tslib... no
Checking for Vulkan... yes
Checking for CUPS... no
Checking for DB2 (IBM)... no
Checking for InterBase... no
Checking for MySQL... no
Checking for OCI (Oracle)... no
Checking for ODBC... no
Checking for PostgreSQL... no
Checking for SQLite (version 2)... no
Checking for TDS (Sybase)... no
Checking for ntddmodm... no
Checking for Socket CAN... yes
Checking for Socket CAN FD... yes
Checking for 64bit pointers... yes
Checking for Sufficiently recent FPU on ARM... yes
Checking for Direct3D 12... no
Checking for Assimp... no
Checking for SDL2... no
Checking for Assimp... no
Checking for Autodesk FBX... no
Checking for Wayland client library... no
Checking for Wayland EGL library... no
Checking for wayland-server... no
Checking for BlueZ... no
Checking for sensorfw... no
Checking for Gypsy... no
Checking for WinRT Geolocation API... no
Checking for ALSA... no
Checking for Vivante GPU... no
Checking for GStreamer 1.0... no
Checking for GStreamer 0.10... no
Checking for Video for Linux... yes
Checking for OpenAL... no
Checking for PulseAudio >= 0.9.10... no
Checking for libresourceqt5... no
Checking for Flite... no
Checking for Speech Dispatcher... no
Checking for libclang... no
Checking for asm/hwcap.h... yes
Checking for architecture supported... yes
Checking for bison... no
Checking for python2... 
Checking for flex... no
Checking for gperf... no
Checking for host pkg-config... /usr/bin/pkg-config
Checking for jumbo build merge limit... 8
Checking for platform supported... 
Checking for build path without whitespace... yes
Checking for submodule initialized... yes
Checking for d-bus... no
Checking for fontconfig... no
Checking for glib-2.0 >= 2.32.0... no
Checking for glibc > 2.16... no
Checking for jsoncpp... no
Checking for khr... yes
Checking for lcms2... no
Checking for libdrm... no
Checking for libevent... no
Checking for libvpx... no
Checking for libwebp, libwebpmux and libwebpdemux... no
Checking for compatible libxml2 and libxslt... no
Checking for minizip... no
Checking for system ninja... no
Checking for nss >= 3.26... no
Checking for opus... no
Checking for protobuf... no
Checking for re2... no
Checking for snappy... no
Checking for x11... no
Checking for xcomposite... no
Checking for xcursor... no
Checking for xi... no
Checking for xtst... no
Checking for zlib... no
Done running configuration tests.

Configure summary:

Building on: linux-g++ (x86_64, CPU features: mmx sse sse2)
Building for: android-clang (arm64, CPU features: neon)
Target compiler: clang 8.0.7
Configuration: cross_compile enable_new_dtags neon shared release c++11 c++14 c++1z concurrent no-pkg-config reduce_exports stl
Build options:
  Mode ................................... release
  Optimize release build for size ........ no
  Building shared libraries .............. yes
  Using C standard ....................... C11
  Using C++ standard ..................... C++17
  Using ccache ........................... no
  Using new DTAGS ........................ yes
  Relocatable ............................ yes
  Using precompiled headers .............. no
  Using LTCG ............................. no
  Target compiler supports:
    NEON ................................. yes
  Build parts ............................ libs
  App store compliance ................... yes
Qt modules and options:
  Qt Concurrent .......................... yes
  Qt D-Bus ............................... no
  Qt D-Bus directly linked to libdbus .... no
  Qt Gui ................................. yes
  Qt Network ............................. yes
  Qt Sql ................................. yes
  Qt Testlib ............................. yes
  Qt Widgets ............................. yes
  Qt Xml ................................. yes
Support enabled for:
  Using pkg-config ....................... no
  udev ................................... no
  Using system zlib ...................... yes
  Zstandard support ...................... no
Qt Core:
  DoubleConversion ....................... yes
    Using system DoubleConversion ........ no
  GLib ................................... no
  iconv .................................. no
  ICU .................................... no
  Built-in copy of the MIME database ..... yes
  Tracing backend ........................ <none>
  Logging backends:
    journald ............................. no
    syslog ............................... no
    slog2 ................................ no
  PCRE2 .................................. yes
    Using system PCRE2 ................... no
Qt Network:
  getifaddrs() ........................... no
  IPv6 ifname ............................ no
  libproxy ............................... no
  Linux AF_NETLINK ....................... yes
  OpenSSL ................................ yes
    Qt directly linked to OpenSSL ........ no
  OpenSSL 1.1 ............................ yes
  DTLS ................................... yes
  OCSP-stapling .......................... yes
  SCTP ................................... no
  Use system proxies ..................... yes
  GSSAPI ................................. no
Qt Gui:
  Accessibility .......................... yes
  FreeType ............................... yes
    Using system FreeType ................ no
  HarfBuzz ............................... yes
    Using system HarfBuzz ................ no
  Fontconfig ............................. no
  Image formats:
    GIF .................................. yes
    ICO .................................. yes
    JPEG ................................. yes
      Using system libjpeg ............... no
    PNG .................................. yes
      Using system libpng ................ no
  Text formats:
    HtmlParser ........................... yes
    CssParser ............................ yes
    OdfWriter ............................ yes
    MarkdownReader ....................... yes
      Using system libmd4c ............... no
    MarkdownWriter ....................... yes
  EGL .................................... yes
  OpenVG ................................. no
  OpenGL:
    Desktop OpenGL ....................... no
    OpenGL ES 2.0 ........................ yes
    OpenGL ES 3.0 ........................ no
    OpenGL ES 3.1 ........................ no
    OpenGL ES 3.2 ........................ no
  Vulkan ................................. yes
  Session Management ..................... yes
Features used by QPA backends:
  evdev .................................. yes
  libinput ............................... no
  INTEGRITY HID .......................... no
  mtdev .................................. no
  tslib .................................. no
  xkbcommon .............................. no
  X11 specific:
    XLib ................................. no
    XCB Xlib ............................. no
    EGL on X11 ........................... no
QPA backends:
  DirectFB ............................... no
  EGLFS .................................. no
  LinuxFB ................................ no
  VNC .................................... no
Qt Sql:
  SQL item models ........................ yes
Qt Widgets:
  GTK+ ................................... no
  Styles ................................. Fusion Windows Android
Qt PrintSupport:
  CUPS ................................... no
Qt Sql Drivers:
  DB2 (IBM) .............................. no
  InterBase .............................. no
  MySql .................................. no
  OCI (Oracle) ........................... no
  ODBC ................................... no
  PostgreSQL ............................. no
  SQLite2 ................................ no
  SQLite ................................. yes
    Using system provided SQLite ......... no
  TDS (Sybase) ........................... no
Qt Testlib:
  Tester for item models ................. yes
Serial Port:
  ntddmodm ............................... no
Qt SerialBus:
  Socket CAN ............................. yes
  Socket CAN FD .......................... yes
  SerialPort Support ..................... yes
Further Image Formats:
  JasPer ................................. no
  MNG .................................... no
  TIFF ................................... yes
    Using system libtiff ................. no
  WEBP ................................... yes
    Using system libwebp ................. no
Qt QML:
  QML network support .................... yes
  QML debugging and profiling support .... yes
  QML just-in-time compiler .............. yes
  QML sequence object .................... yes
  QML XML http request ................... yes
  QML Locale ............................. yes
Qt QML Models:
  QML list model ......................... yes
  QML delegate model ..................... yes
Qt Quick:
  Direct3D 12 ............................ no
  AnimatedImage item ..................... yes
  Canvas item ............................ yes
  Support for Qt Quick Designer .......... yes
  Flipable item .......................... yes
  GridView item .......................... yes
  ListView item .......................... yes
  TableView item ......................... yes
  Path support ........................... yes
  PathView item .......................... yes
  Positioner items ....................... yes
  Repeater item .......................... yes
  ShaderEffect item ...................... yes
  Sprite item ............................ yes
QtQuick3D:
  Assimp ................................. yes
  System Assimp .......................... no
Qt Scxml:
  ECMAScript data model for QtScxml ...... yes
Qt Gamepad:
  SDL2 ................................... no
Qt 3D:
  Assimp ................................. yes
  System Assimp .......................... no
  Output Qt3D Job traces ................. no
  Output Qt3D GL traces .................. no
  Use SSE2 instructions .................. no
  Use AVX2 instructions .................. no
  Aspects:
    Render aspect ........................ yes
    Input aspect ......................... yes
    Logic aspect ......................... yes
    Animation aspect ..................... yes
    Extras aspect ........................ yes
Qt 3D Renderers:
  OpenGL Renderer ........................ yes
Qt 3D GeometryLoaders:
  Autodesk FBX ........................... no
Qt Wayland Client ........................ no
Qt Wayland Compositor .................... no
Qt Bluetooth:
  BlueZ .................................. no
  BlueZ Low Energy ....................... no
  Linux Crypto API ....................... no
  Native Win32 Bluetooth ................. no
  WinRT Bluetooth API (desktop & UWP) .... no
  WinRT advanced bluetooth low energy API (desktop & UWP) . no
Qt Sensors:
  sensorfw ............................... no
Qt Quick Controls 2:
  Styles ................................. Default Fusion Imagine Material Universal
Qt Quick Templates 2:
  Hover support .......................... yes
  Multi-touch support .................... yes
Qt Positioning:
  Gypsy GPS Daemon ....................... no
  WinRT Geolocation API .................. no
Qt Location:
  Qt.labs.location experimental QML plugin . yes
  Geoservice plugins:
    OpenStreetMap ........................ yes
    HERE ................................. yes
    Esri ................................. yes
    Mapbox ............................... yes
    MapboxGL ............................. yes
    Itemsoverlay ......................... yes
QtXmlPatterns:
  XML schema support ..................... yes
Qt Multimedia:
  ALSA ................................... no
  GStreamer 1.0 .......................... no
  GStreamer 0.10 ......................... no
  Video for Linux ........................ yes
  OpenAL ................................. no
  PulseAudio ............................. no
  Resource Policy (libresourceqt5) ....... no
  Windows Audio Services ................. no
  DirectShow ............................. no
  Windows Media Foundation ............... no
Qt TextToSpeech:
  Flite .................................. no
  Flite with ALSA ........................ no
  Speech Dispatcher ...................... no
Qt Tools:
  QDoc ................................... no
Qt WebEngine Build Tools:
  Use System Ninja ....................... no
  Use System Gn .......................... no
  Jumbo Build Merge Limit ................ 8
  Developer build ........................ no
  QtWebEngine required system libraries:
    fontconfig ........................... no
    dbus ................................. no
    nss .................................. no
    khr .................................. yes
    glibc ................................ no
  Optional system libraries used:
    re2 .................................. no
    icu .................................. no
    libwebp, libwebpmux and libwebpdemux . no
    opus ................................. no
    ffmpeg ............................... no
    libvpx ............................... no
    snappy ............................... no
    glib ................................. no
    zlib ................................. no
    minizip .............................. no
    libevent ............................. no
    jsoncpp .............................. no
    protobuf ............................. no
    libxml2 and libxslt .................. no
    lcms2 ................................ no
    png .................................. no
    JPEG ................................. no
    harfbuzz ............................. no
    freetype ............................. no

Note: Also available for Linux: linux-clang linux-icc

Note: No wayland-egl support detected. Cross-toolkit compatibility disabled.

Note: The following modules are not being compiled in this configuration:
    webenginecore
    webengine
    webenginewidgets

WARNING: Cross compiling without sysroot. Disabling pkg-config

WARNING: QDoc will not be compiled, probably because libclang could not be located. This means that you cannot build the Qt documentation.

Either ensure that llvm-config is in your PATH environment variable, or set LLVM_INSTALL_DIR to the location of your llvm installation.
On Linux systems, you may be able to install libclang by installing the libclang-dev or libclang-devel package, depending on your distribution.
On macOS, you can use Homebrew's llvm package.
On Windows, you must set LLVM_INSTALL_DIR to the installation path.

WARNING: Tool gperf is required to build QtWebEngine.

WARNING: QtWebEngine will not be built.

WARNING: QtPdf will not be built.

Qt is now configured for building. Just run 'gmake'.
Once everything is built, you must run 'gmake install'.
Qt will be installed into '/usr/local/Qt-5.14.0'.

```
