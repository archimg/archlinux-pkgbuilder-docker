FROM archimg/base-devel
MAINTAINER Benedikt Heine

ARG MIRROR_URL="https://mirrors.kernel.org/archlinux/\$repo/os/\$arch"

RUN echo "Server = ${MIRROR_URL}" > /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm \
         bzr \
         git \
         mercurial \
         namcap \
         pkgbuild-introspection \
         svn \
    && rm -f \
         /var/cache/pacman/pkg/* \
         /var/lib/pacman/sync/* \
         /etc/pacman.d/mirrorlist.pacnew \
    && useradd -Um build \
    && mkdir /pkg

ADD rootfs /

ENTRYPOINT ["/srv/docker-buildpkg"]
