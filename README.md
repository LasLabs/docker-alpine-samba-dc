[![License: Apache 2.0](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/LasLabs/docker-alpine-samba-dc.svg?branch=master)](https://travis-ci.org/LasLabs/docker-alpine-samba-dc)

[![](https://images.microbadger.com/badges/image/laslabs/alpine-samba-dc.svg)](https://microbadger.com/images/laslabs/alpine-samba-dc "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/laslabs/alpine-samba-dc.svg)](https://microbadger.com/images/laslabs/alpine-samba-dc"Get your own version badge on microbadger.com")

Docker - Alpine Samba Domain Controller
=======================================

This image provides a Samba 4 Domain Controller using an Alpine Linux base.

Configuration
=============

*

Usage
=====

*

Build Arguments
===============

The following build arguments are available for customization:


| Name | Default | Description |
|------|---------|-------------|


Environment Variables
=====================

The following environment variables are available for your configuration
pleasure:

| Name | Default | Description |
|------|---------|-------------|
| SAMBA_DC_REALM | corp.example.net | The realm to launch the DC into
| SAMBA_DC_DOMAIN | EXAMPLE | The NetBIOS Domain Name
| SAMBA_DC_ADMIN_PASSWD | 5u3r53cur3! | The AD DC `Administrator` user password
| SAMBA_DC_DNS_BACKEND | SAMBA_INTERNAL | The DNS backend to use

Known Issues / Roadmap
======================

Bug Tracker
===========

Bugs are tracked on [GitHub Issues](https://github.com/LasLabs/docker-alpine-samba-dc/issues).
In case of trouble, please check there to see if your issue has already been reported.
If you spotted it first, help us smash it by providing detailed and welcomed feedback.

Credits
=======

Contributors
------------

* Ted Salmon <tsalmon@laslabs.com>

Maintainer
----------

[![LasLabs Inc.](https://laslabs.com/logo.png)](https://laslabs.com)

This module is maintained by [LasLabs Inc.](https://laslabs.com)

* https://github.com/LasLabs/docker-alpine-samba-dc
