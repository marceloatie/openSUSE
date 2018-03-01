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
zypper addrepo http://packman.inode.at/suse/openSUSE_Leap_15.0/ 'packman' -p 90
zypper addrepo https://dl.google.com/linux/rpm/stable/x86_64/ 'google-chrome' -p 80
zypper addrepo http://download.opensuse.org/repositories/home:marceloatie/openSUSE_Leap_15.0/home:marceloatie.repo 'telegram' -p 80
zypper addrepo http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.0/ 'mozilla' -p 80

zypper refresh

# - Install new software
zypper dup --from http://packman.inode.at/suse/openSUSE_Leap_15.0/
zypper in telegram, google-chrome-stable, vlc, vlc-codecs, qbittorrent, fuse-exfat
