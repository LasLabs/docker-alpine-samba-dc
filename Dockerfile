FROM clouder/base:3.4
MAINTAINER Ted Salmon tsalmon@laslabs.com

RUN apk add --no-cache samba-dc

# Remove default Samba configs
RUN rm -f /etc/samba/smb.conf
RUN rm -rf /var/lib/samba/*
