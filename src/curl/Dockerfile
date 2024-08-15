FROM alpine:3.12 as base

##https://raw.githubusercontent.com/moparisthebest/static-curl/master/build.sh


ARG CURL_VERSION='8.7.1'

RUN apk add gnupg
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

# set up any required curl options here
#LDFLAGS="-static" PKG_CONFIG="pkg-config --static" ./configure --disable-shared --enable-static --disable-libcurl-option --without-brotli --disable-manual --disable-unix-sockets --disable-dict --disable-file --disable-gopher --disable-imap --disable-smtp --disable-rtsp --disable-telnet --disable-tftp --disable-pop3 --without-zlib --disable-threaded-resolver --disable-ipv6 --disable-smb --disable-ntlm-wb --disable-tls-srp --disable-crypto-auth --without-ngtcp2 --without-nghttp2 --disable-ftp --disable-mqtt --disable-alt-svc --without-ssl

ENV LDFLAGS="-static"
ENV PKG_CONFIG="pkg-config --static"
RUN ./configure --disable-shared --enable-static --disable-ldap --enable-ipv6 \
    --enable-unix-sockets --with-ssl --with-libssh2 --disable-docs \
    --disable-manual --without-libpsl

RUN make -j4 V=1 LDFLAGS="-static -all-static"

# binary is ~13M before stripping, 2.6M after
RUN strip src/curl

# print out some info about this, size, and to ensure it's actually fully static
RUN ls -lah src/curl
RUN file src/curl
# exit with error code 1 if the executable is dynamic, not static
RUN ldd src/curl && exit 1 || true

RUN ./src/curl -V
RUN cp ./src/curl /src/curl

FROM scratch AS final

COPY --from=base /src/curl /bin/curl

CMD ["/bin/curl"]

