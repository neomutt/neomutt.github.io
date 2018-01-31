---
layout: concertina
distro: cygwin
icon: cygwin.png
homepage: https://www.cygwin.com/
title: NeoMutt for Cygwin
maintainer: Federico Kircheis
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Overview <a class="offset" id="overview"></a>

Cygwin provides a collection of GNU and Open Source tools for Windows.

## Support <a class="offset" id="support"></a>

Cygwin supports Windows versions from Windows Vista.
NeoMutt can be therefore installed on any version (32 and 64 bit) of Windows that came after and including Vista.
The 32 bit version of Cygwin (and therefore NeoMutt too) can also run through the [WoW64](https://en.wikipedia.org/wiki/WoW64) 32 bit environment of Windows on Windows 64 bit, the 64 bit version of course only on 64 bit Windows.

Cygwin also allows you to install Mutt and NeoMutt at the same time.

## Installation <a class="offset" id="install"></a>

Since 2018 NeoMutt is available as a Cygwin package, to install it, grab the latest version of the [Cygwin setup](https://cygwin.com/install.html) and select the NeoMutt package.

## Update <a class="offset" id="update"></a>

To upgrade NeoMutt, just run the [Cygwin setup](https://cygwin.com/install.html) again.
If there are updates for the package, you'll be notified.

## Removal <a class="offset" id="remove"></a>

To remove NeoMutt from Cygwin, run the [Cygwin setup](https://cygwin.com/install.html) and deselect the package.

## Building from source <a class="offset" id="build"></a>

All dependencies (required and optional), are already packaged and provided by Cygwin.

To download and build NeoMutt, just type
```shell
git clone https://github.com/neomutt/neomutt.git
./configure
make
````

Following packages are required for building NeoMutt (and its documentation)
```
libxslt libxml2 docbook-xsl docbook-xml42 gettext-devel libncurses-devel libiconv-devel libidn-devel
````
You can install them with the [Cygwin setup](https://cygwin.com/install.html).


You'll probably want NeoMutt to support [TLS](https://en.wikipedia.org/wiki/TLS-SRP) and [SASL](https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer) (you might be otherwise unable to configure your email client).
Those are not enabled by default, you need to call configure with "-sasl" and "-ssl" if using [OpenSSL](https://www.openssl.org/), otherwise if using [GnuTLS](https://gnutls.org) with "--gnutls"

Following packages would be therefore also required for a successful build:
```
openssl-devel libsasl2-devel
````

You can find further instructions on the [guide for building NeoMutt](/dev/build).


## Debugging <a class="offset" id="debug"></a>

The [guide for debugging NeoMutt](/dev/debug) can be applied without any change for debugging NeoMutt in the Cygwin environment.

