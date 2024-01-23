#!/bin/bash

# This script upgrades the Debian version (I do it from 11 to 12) in order to bypass that debian 12 requires uefi

if [ "${UPGRADE}" == "true" ]
then

  export DEBIAN_FRONTEND=noninteractive
  export UCF_FORCE_CONFFOLD=1

  #basic updates
  apt-get -y update
  apt-get -y upgrade
  apt-get -y --purge autoremove


  #sources.list, replace bullseye to bookworm
  sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list

  #bookworm updates
  apt-get -y update
  apt-get -y upgrade --without-new-pkgs
  apt-get -y full-upgrade
fi