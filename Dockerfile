FROM alpine:3.17

ARG VERSION
ARG BUILD_DATE

LABEL maintainer="Andrew Cutler <andrew@panubo.com>" \
      org.opencontainers.image.authors="Andrew Cutler <andrew@panubo.com>,Joseph Lamoree <joseph@lamoree.com>" \
      org.opencontainers.image.title="Docker Postfix Log Entry Summarizer" \
      org.opencontainers.image.version="$VERSION" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.url="https://github.com/jlamoree/docker-pflogsumm" \
      org.opencontainers.image.created="${BUILD_DATE}"

RUN apk add --update pflogsumm=$VERSION && \
    rm -rf /var/cache/apk/*

CMD ["/usr/bin/pflogsumm"]
