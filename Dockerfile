# Chris Weyl <cweyl@alumni.drew.edu> 2017

FROM alpine:3.6
MAINTAINER Chris Weyl <cweyl@alumni.drew.edu>

RUN apk update && \
    apk add \
        wget make gcc perl-dev musl-dev \
        perl perl-moose perl-namespace-autoclean perl-sub-exporter \
        perl-extutils-config perl-extutils-installpaths \
        perl-encode \
        && \
    rm -r /var/cache/

COPY cpanm /bin/cpanm

ENTRYPOINT [ "perl" ]
