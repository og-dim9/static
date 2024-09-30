FROM alpine:3.12 as base

##https://raw.githubusercontent.com/moparisthebest/static-curl/master/build.sh


ARG CURL_VERSION='8.7.1'

RUN apk add gnupg upx
WORKDIR /src
RUN wget https://curl.haxx.se/download/curl-${CURL_VERSION}.tar.gz
RUN tar -xvf curl-${CURL_VERSION}.tar.gz

WORKDIR /src/curl-${CURL_VERSION}/

# dependencies to build curl
RUN apk add \
    build-base clang openssl-dev nghttp2-dev \
    nghttp2-static libssh2-dev libssh2-static perl

# these are missing on at least armhf
RUN apk add openssl-libs-static zlib-static || true

ENV CC=clang

ENV LDFLAGS="-static"
ENV PKG_CONFIG="pkg-config --static"
RUN ./configure --disable-shared --enable-static --enable-ipv6 \
    --enable-unix-sockets --with-ssl --with-libssh2 \
    --disable-mqtt --disable-smb --disable-rtsp --disable-telnet --disable-tftp \
    --disable-gopher --disable-imap --disable-smtp --disable-pop3 \
    --disable-manual --disable-docs --without-libpsl

RUN make -j4 V=1 LDFLAGS="-static -all-static"

# print out some info about this, size, and to ensure it's actually fully static
RUN ls -lah src/curl
RUN file src/curl
# exit with error code 1 if the executable is dynamic, not static
RUN ldd src/curl && exit 1 || true

RUN ./src/curl -V
RUN cp ./src/curl /src/curl
RUN strip -s /src/curl
RUN upx --best --lzma /src/curl

FROM dim9/static:sh-1.33.1 AS final
SHELL ["/bin/sh"]
COPY --from=base /src/curl /bin/curl
RUN ["/bin/curl", "--version"]
CMD ["/bin/curl"]

