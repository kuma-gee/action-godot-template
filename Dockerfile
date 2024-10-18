FROM fedora:40

RUN dnf install -y \
  git \
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
  libatomic-static \
  python3

RUN dnf -y install --setopt=install_weak_deps=False \
    mingw32-gcc mingw32-gcc-c++ mingw32-winpthreads-static mingw64-gcc mingw64-gcc-c++ mingw64-winpthreads-static

RUN git clone https://github.com/emscripten-core/emsdk.git
RUN /emsdk/emsdk install 3.1.64

COPY build-template.sh /build-template.sh

ENTRYPOINT ["/build-template.sh"]
