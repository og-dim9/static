#https://github.com/jirutka/stunnel-static/blob/master/build.sh
FROM alpine:3.20 AS base

RUN apk add bash git gnupg build-base alpine-sdk upx automake autoconf \
        build-base linux-headers openssl-dev openssl-libs-static pkgconf autoconf-archive
ARG VERSION=5.73
ARG CFLAGS="-Os -fomit-frame-pointer -pipe"

RUN git clone https://github.com/mtrojnar/stunnel  --single-branch --branch stunnel-${VERSION} /src
WORKDIR /src
RUN sed -i 's/^stunnel_LDFLAGS = /&-all-static /' src/Makefile.in
RUN ./configure \
        --prefix=/ \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-fips \
        --disable-shared \
        --enable-static \
        --disable-silent-rules
RUN make
RUN strip -s src/stunnel
RUN upx --best --lzma src/stunnel -o /src/stunnel

FROM dim9/static:sh AS final
COPY --from=base /src/stunnel /bin/stunnel
CMD ["/bin/stunnel"]

LABEL maintainer=dim9

