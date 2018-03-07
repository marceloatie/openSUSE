#!/bin/sh

# - Google's Certificate
rpm --import https://dl.google.com/linux/linux_signing_key.pub

# - Remove ALL repositories
rm /etc/zypp/repos.d/*
zypper refresh

# - Add main repositories
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo -p 99 http://download.opensuse.org/distribution/leap/42.3/repo/oss/suse/ 'openSUSE'
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo -p 99 http://download.opensuse.org/distribution/leap/42.3/repo/non-oss/suse/ 'openSUSE non-oss'
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo --refresh -p 99 http://download.opensuse.org/update/leap/42.3/oss/ 'openSUSE update'
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo --refresh -p 99 http://download.opensuse.org/update/leap/42.3/non-oss/ 'openSUSE update non-oss'

# - Add third part repositories
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo --refresh -p 90 http://packman.inode.at/suse/openSUSE_Leap_42.3/ 'packman'
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo --refresh -p 80 https://dl.google.com/linux/rpm/stable/x86_64/ 'google-chrome'
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo --refresh -p 80 http://download.opensuse.org/repositories/home:/marceloatie/openSUSE_Leap_42.3/ 'telegram'
zypper --quiet --non-interactive --gpg-auto-import-keys addrepo --refresh -p 80 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_42.3/ 'mozilla'

# - Install new software
zypper refresh
zypper --non-interactive dist-upgrade --allow-vendor-change --from packman
zypper --non-interactive dist-upgrade --allow-vendor-change --from mozilla
zypper --non-interactive install telegram google-chrome-stable vlc vlc-codecs qbittorrent fuse-exfat
