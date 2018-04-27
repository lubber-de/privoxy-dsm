#!/bin/sh
# Copyright (c) 2000-2016 Synology Inc. All rights reserved.

. /pkgscripts/include/pkg_util.sh

package="privoxy"
version="3.0.26-1"
displayname="privoxy"
arch="$(pkg_get_platform)"
maintainer="David Cavallini"
distributor="davidcava"
distributor_url="https://github.com/davidcava/"
support_url="https://github.com/davidcava/privoxy-dsm/wiki"
description="Privoxy package for Synology DSM."
description_fre="Paquet Privoxy pour Synology DSM."
ctl_stop="yes"
silent_install="yes"
silent_upgrade="yes"
silent_uninstall="yes"
precheckstartstop="no"
#adminprotocol="http"
#adminport=""
#adminurl="/webman/3rdparty/privoxy/"
#startstop_restart_services="nginx"
silent_install="yes"
silent_upgrade="yes"
silent_uninstall="yes"
dsmuidir="ui"
dsmappname=SYNO.SDS.Privoxy.Application

[ "$(caller)" != "0 NULL" ] && return 0

pkg_dump_info