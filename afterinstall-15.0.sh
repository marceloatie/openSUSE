#!/bin/sh

# - Google's Certificate
wget https://dl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
rm linux_signing_key.pub

# - Remove unused repositories
# debug
zypper removerepo http://download.opensuse.org/debug/distribution/leap/15.0/repo/oss/
zypper removerepo http://download.opensuse.org/debug/distribution/leap/15.0/repo/non-oss/
zypper removerepo http://download.opensuse.org/debug/update/leap/15.0/repo/oss/
zypper removerepo http://download.opensuse.org/debug/update/leap/15.0/repo/non-oss/
# source
zypper removerepo http://download.opensuse.org/source/distribution/leap/15.0/repo/oss/
zypper removerepo http://download.opensuse.org/source/distribution/leap/15.0/repo/non-oss/

# - Add third part repositories
zypper addrepo -p 90 http://packman.inode.at/suse/openSUSE_Leap_15.0/ 'packman'
zypper addrepo -p 80 https://dl.google.com/linux/rpm/stable/x86_64/ 'google-chrome'
zypper addrepo -p 80 http://download.opensuse.org/repositories/home:marceloatie/openSUSE_Leap_15.0/home:marceloatie.repo 'telegram' 
zypper addrepo -p 80 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.0/ 'mozilla'

# - Install new software
zypper refresh
zypper -n dist-upgrade --allow-vendor-change --from packman
zypper -n dist-upgrade --allow-vendor-change --from mozilla
zypper -n install telegram google-chrome-stable vlc vlc-codecs qbittorrent fuse-exfat
