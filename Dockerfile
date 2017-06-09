FROM alpine:latest

MAINTAINER Andrew Cutler <andrew@panubo.com>

RUN apk add --update pflogsumm && \
    rm -rf /var/cache/apk/*

CMD ["/usr/bin/pflogsumm"]
