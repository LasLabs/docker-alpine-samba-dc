Samba4 Domain Controller Based on Alpine
========================================

This repo provides a docker file that can be used to create an image running
Samba 4 DC. By default, we clear the basic configs created by the Samba Installer.

Note that you will need to provide an Image mounted to `/var/lib/samba` in order
to persist any data.

Credits
=======

Contributors
------------

* Ted Salmon <tsalmon@laslabs.com>

Maintainer
----------

This Dockerfile is maintained by [LasLabs Inc.](https://laslabs.com)

* https://github.com/laslabs/clouder-samba-dc/
