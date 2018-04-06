#!/bin/sh

# - Google's Certificate
rpm --import https://dl.google.com/linux/linux_signing_key.pub

# - Remove unused repositories
# debug
zypper removerepo http://download.opensuse.org/debug/distribution/leap/15.0/repo/oss/
zypper removerepo http://download.opensuse.org/debug/distribution/leap/15.0/repo/non-oss/
zypper removerepo http://download.opensuse.org/debug/update/leap/15.0/oss/
zypper removerepo http://download.opensuse.org/debug/update/leap/15.0/non-oss/
# source
zypper removerepo http://download.opensuse.org/source/distribution/leap/15.0/repo/oss/
zypper removerepo http://download.opensuse.org/source/distribution/leap/15.0/repo/non-oss/
# installation media
zypper removerepo openSUSE-Leap-15.0-1

# - Add third part repositories
zypper --quiet --non-interactive addrepo --refresh -p 90 http://packman.inode.at/suse/openSUSE_Leap_15.0/ 'packman'
zypper --quiet --non-interactive addrepo --refresh -p 80 https://dl.google.com/linux/rpm/stable/x86_64/ 'google-chrome'
zypper --quiet --non-interactive addrepo --refresh -p 80 http://download.opensuse.org/repositories/home:/marceloatie/openSUSE_Leap_15.0/ 'home:marceloatie'
zypper --quiet --non-interactive addrepo --refresh -p 90 http://download.opensuse.org/repositories/home:/opensuseitalia/openSUSE_Leap_15.0/ 'home:opensuseitalia'
zypper --quiet --non-interactive addrepo --refresh -p 80 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.0/ 'mozilla'
zypper --gpg-auto-import-keys refresh

# - Install new software
zypper --non-interactive dist-upgrade --allow-vendor-change --from packman
zypper --non-interactive dist-upgrade --allow-vendor-change --from mozilla
zypper --non-interactive install telegram google-chrome-stable vlc vlc-codecs qbittorrent fuse-exfat exfat-utils unar axel nmap imagewriter
# 15.0 / KDE stuff!
zypper --non-interactive install falkon latte-dock yakuake
#check for codecs
zypper --non-interactive install libgstadaptivedemux-1_0-0 libgstbadaudio-1_0-0 libgstbadbase-1_0-0 libgstbadvideo-1_0-0 libgstbasecamerabinsrc-1_0-0 libgstcodecparsers-1_0-0 libgstgl-1_0-0 libgstmpegts-1_0-0 libgstphotography-1_0-0 libgsturidownloader-1_0-0 libgstwayland-1_0-0 libquicktime0 libsox3 sox vlc-codec-gstreamer
