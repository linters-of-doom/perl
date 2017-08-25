# Chris Weyl <cweyl@alumni.drew.edu> 2017

FROM alpine:3.6
MAINTAINER Chris Weyl <cweyl@alumni.drew.edu>

RUN apk update && \
    apk add \
        wget make gcc perl perl-dev musl-dev \
            perl-clone \
            perl-datetime \
            perl-encode \
            perl-extutils-cchecker \
            perl-extutils-config \
            perl-extutils-depends \
            perl-extutils-helpers \
            perl-extutils-installpaths \
            perl-extutils-libbuilder \
            perl-extutils-pkgconfig \
            perl-file-find-rule \
            perl-file-sharedir-install \
            perl-file-slurp \
            perl-json \
            perl-json-maybexs \
            perl-list-allutils \
            perl-list-moreutils \
            perl-lwp-mediatypes \
            perl-lwp-protocol-https \
            perl-lwp-useragent-determined \
            perl-module-build \
            perl-module-build-tiny \
            perl-module-runtime \
            perl-module-scandeps \
            perl-moo \
            perl-moose \
            perl-moox-types-mooselike \
            perl-namespace-autoclean \
            perl-params-validate \
            perl-params-validationcompiler \
            perl-path-class \
            perl-path-tiny \
            perl-role-tiny \
            perl-specio \
            perl-sub-exporter \
            perl-sub-exporter \
            perl-sub-exporter-progressive \
            perl-sub-identify \
            perl-sub-info \
            perl-sub-install \
            perl-sub-name \
            perl-sub-uplevel \
            perl-template-toolkit \
            perl-term-readkey \
            perl-term-table \
            perl-test-exception \
            perl-test-most \
            perl-text-template \
            perl-timedate \
        && \
    rm -r /var/cache/

COPY cpanm /bin/cpanm

RUN cpanm -q \
        Devel::OverloadInfo \
        UNIVERSAL::can \
        MooseX::AttributeShortcuts \
        Smart::Comments \
        || ( cat "$HOME/.cpanm/build.log" ; exit 1 ) \
        && rm -rf "$HOME/.cpanm/"

ENTRYPOINT [ "perl" ]
