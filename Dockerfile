FROM alpine:latest
MAINTAINER LasLabs Inc <support@laslabs.com>


ENV SAMBA_DC_ETC=/etc/samba
ENV SAMBA_DC_DATA=/var/lib/samba
ENV SAMBA_DC_LOGS=/var/log/samba
ENV SAMBA_DC_REALM='corp.example.net'
ENV SAMBA_DC_DOMAIN='EXAMPLE'
ENV SAMBA_DC_ADMIN_PASSWD='5u3r53cur3!'
ENV SAMBA_DC_DNS_BACKEND=SAMBA_INTERNAL

# Install
RUN apk add --no-cache samba-dc supervisor \
    # Remove default config data, if any
    && rm -f /etc/samba/smb.conf \
    && rm -rf /var/lib/samba/* \
    # Configure
    && samba-tool domain provision --domain=$SAMBA_DC_DOMAIN \
    --adminpass=$SAMBA_DC_ADMIN_PASSWD \
    --server-role=dc \
    --realm=$SAMBA_DC_REALM \
    --dns-backend=$SAMBA_DC_DNS_BACKEND

# Expose ports
EXPOSE 37/udp 53 88 135/tcp 137/udp 138/udp 139 389 445 464 636/tcp 1024-5000/tcp 3268/tcp 3269/tcp

# Persist the configuration, data and log directories
VOLUME ["$SAMBA_DC_ETC", "$SAMBA_DC_DATA", "$SAMBA_DC_LOGS"]

# Copy & set entrypoint for manual access
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["samba"]

# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Samba DC - Alpine" \
      org.label-schema.description="Provides a Docker image for Samba 4 DC on Alpine Linux." \
      org.label-schema.url="https://laslabs.com/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/LasLabs/docker-alpine-samba-dc" \
      org.label-schema.vendor="LasLabs Inc." \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
