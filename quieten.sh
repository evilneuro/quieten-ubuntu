#!/usr/bin/env bash
# 
# quieten.sh
#
# h/t
# https://askubuntu.com/questions/1452519/what-are-the-services-apt-news-and-esm-cache-and-how-do-i-disable-them
# https://askubuntu.com/questions/1441035/what-is-meant-by-apt-news/
# https://askubuntu.com/questions/795226/how-to-list-all-enabled-services-from-systemctl
# https://askubuntu.com/questions/1083504/how-to-disable-the-advertisements-when-sshing-into-an-ubuntu-machine
# 
# (c) 2023 William Anderson <neuro@well.com>
# SPDX-License-Identifier: MIT

if [ ${EUID} -ne 0 ]; then echo "$(basename $0): must be run with sudo or as root" >&2; exit 1; fi

# Disable calling the MOTD news service at https://motd.ubuntu.com/
if [ -s /etc/default/motd-news ]; then sed -i 's/ENABLED=1/ENABLED=0/' /etc/default/motd-news; fi

# Disable the ESM apps prompt while using apt
if [ -s /etc/apt/apt.conf.d/20apt-esm-hook.conf ]; then mv /etc/apt/apt.conf.d/20apt-esm-hook.conf /etc/apt/apt.conf.d/20apt-esm-hook.conf.disabled; fi

# Disable Ubuntu Pro / Advantage marketing messages while using apt
if [ "$(dpkg -l ubuntu-advantage-tools | grep ^ii)" != "" ]; then pro config set apt_news=false; fi

# Disable login documentation links and marketing messages
for UPDATEMOTD_UNIT in 10-help-text 50-motd-news 88-esm-announce 91-contract-ua-esm-status 91-release-upgrade 95-hwe-eol
do
    if [ -s /etc/update-motd.d/${UPDATEMOTD_UNIT} ]; then chmod 644 /etc/update-motd.d/${UPDATEMOTD_UNIT}; fi
done

# Disable additional marketing messages
for SYSTEMD_UNIT in apt-news esm-cache
do
    if [ "$(systemctl list-unit-files --state=enabled | grep -w ^${SYSTEMD_UNIT}\.service)" != "" ]; then systemctl mask ${SYSTEMD_UNIT}.service; fi
done