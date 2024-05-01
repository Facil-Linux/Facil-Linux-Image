#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install/Remove packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs/removes a package from fedora/RPMfusion repos
rpm-ostree override remove pipewire-pulseaudio --install pulseaudio && \
ostree container commit && \
rpm-ostree override remove \
ptyxis \
kde-connect-libs \
kdeconnectd \
kde-connect \
krfb \
krfb-libs \
qsynth && \
ostree container commit && \
rpm-ostree install \
konsole \
rust \
cargo && \
ostree container commit