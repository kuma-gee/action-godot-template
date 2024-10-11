FROM fedora:40

RUN dnf install -y \
  scons \
  pkgconfig \
  libX11-devel \
  libXcursor-devel \
  libXrandr-devel \
  libXinerama-devel \
  libXi-devel \
  wayland-devel \
  mesa-libGL-devel \
  mesa-libGLU-devel \
  alsa-lib-devel \
  pulseaudio-libs-devel \
  libudev-devel \
  gcc-c++ \
  libstdc++-static \
  libatomic-static

RUN dnf -y install --setopt=install_weak_deps=False \
    mingw32-gcc mingw32-gcc-c++ mingw32-winpthreads-static mingw64-gcc mingw64-gcc-c++ mingw64-winpthreads-static

COPY build-template.sh /build-template.sh

ENTRYPOINT ["/build-template.sh"]
