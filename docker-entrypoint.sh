#!/bin/sh
# Copyright 2017-TODAY LasLabs Inc.
# License Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0.html).

set -e

COMMAND=ash

# Add $COMMAND if needed
if [ "${1:0:1}" = '-' ]; then
	set -- $COMMAND "$@"
fi

# Configure the AD DC
if [ ! -f /samba/etc/smb.conf ]; then
    mkdir -p /samba/etc /samba/lib /samba/log
    echo "${SAMBA_DC_DOMAIN} - Begin Domain Provisioning"
    samba-tool domain provision --domain="${SAMBA_DC_DOMAIN}" \
        --adminpass="${SAMBA_DC_ADMIN_PASSWD}" \
        --server-role=dc \
        --realm="${SAMBA_DC_REALM}" \
        --dns-backend="${SAMBA_DC_DNS_BACKEND}"
    echo "${SAMBA_DC_DOMAIN} - Domain Provisioned Successfully"
fi

# Run ntp server
/usr/bin/chronyd -x -d &

if [ "$1" = 'samba' ]; then
    exec /usr/sbin/samba -i
fi

# Assume that user wants to run their own process,
# for example a `bash` shell to explore this image
exec "$@"
