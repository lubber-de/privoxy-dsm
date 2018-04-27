# privoxy-dsm
Privoxy package for Synology DSM 6

# Installation
Download the spk for your architecture from the release section, then install using Synology Package Center button _Manual Install_. See  architectures on [Synology knowledge base](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General/What_kind_of_CPU_does_my_NAS_have).

# Usage
Privoxy on Synology can be used:
- As the filtering proxy it is normally meant to be (default setup),
- Or as a neutral HTTP/HTTPS proxy that forwards requests through a SOCKS proxy for your other Synology apps (SickRage, CouchPotato...).

You need to manually adapt the Privoxy config file installed in /var/packages/privoxy/etc/config accordingly.
Especially, change listen address to 0.0.0.0 if you wish to use the proxy not only from your Synology applications. In this case you also need to open the port 8118 in Synology firewall.
Config changes are immediately taken into account - no need to restart the service.

Your modifications in `config` file are preserved in case of package uninstallation/reinstallation or upgrade. When a modified config file already exists, the installer will install instead `config.new` in same folder.

Additionaly to the [normal Privoxy way](https://www.privoxy.org/user-manual/configuration.html), the Privoxy admin page can also be opened from within DSM by clicking on the Privoxy icon when authenticated as admin user. This allows to use the admin pages even though the proxy is not accessible from outside the Synology machine (when it listens on 127.0.0.1 or firewall port 8118 is kept closed).

# Limitation
The package is designed and built for DSM 6.1.

It will probably not install or work on earlier DSM versions.
It might work on more recent DSM versions but I have not tested.
Listening port should be left as default (8118) (changing it probably breaks admin pages and maybe other things).

The wizard setup options are not handled yet so you will need to manually edit the config file after install if the default config does not suit you.

# Build from source
- Download Privoxy source code into DSM toolkit
  ```sh
  cd source
  wget https://www.privoxy.org/sf-download-mirror/Sources/3.0.26%20%28stable%29/privoxy-3.0.26-stable-src.tar.gz
  tar xzf privoxy-3.0.26-stable-src.tar.gz
  mv privoxy-3.0.26-stable privoxy
  cd privoxy
  ```
- Get privoxy-dsm folders `synology` and `SynoBuildConf`
- Workaround DSM toolkit missing `group`
  ```sh
  cp /usr/bin/groups /toolkit/build_env/ds.evansport-6.1/usr/bin
  ```
- Build for your architecture, example
  ```sh
  /toolkit/pkgscripts-ng/PkgCreate.py -p evansport -x0 -c privoxy
  ```
- If everything went fine, package is now in `/toolkit/result_spk`

# Licence
    Copyright (c) 2018 David Cavallini

    privoxy-dsm is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    privoxy-dsm is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with privoxy-dsm.  If not, see <http://www.gnu.org/licenses/>.
