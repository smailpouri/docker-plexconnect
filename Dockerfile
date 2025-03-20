FROM alpine:3.14

# Install Python 2 and dependencies
RUN apk -U add \
    python2 \
    py-pillow \
    git \
    shadow \
    openssl \
    bash \
    && rm -fr /var/cache/apk/*

# Copy the modified init script
COPY init /init
RUN chmod +x /init

# Keep the same volume for persistence
VOLUME /PlexConnect

# Use the same init script
CMD ["/init"]

# Expose required ports
EXPOSE 80
EXPOSE 443
EXPOSE 53
