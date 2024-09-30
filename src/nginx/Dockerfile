#https://gist.github.com/niklasvincent/9709182
FROM debian:stable-slim AS builder

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    wget \
    libpcre3-dev \
    zlib1g-dev \
    libssl-dev \
    patch \
    file

ARG NGINX_VERSION="1.26.2"
ARG PCRE_VERSION="8.34"
ARG ZLIB_VERSION="1.3.1"
ARG OPENSSL_VERSION="3.3.2"

ENV NGINX_TARBALL="nginx-${NGINX_VERSION}.tar.gz"
ENV PCRE_TARBALL="pcre-${PCRE_VERSION}.tar.gz"
ENV ZLIB_TARBALL="zlib-${ZLIB_VERSION}.tar.gz"
ENV OPENSSL_TARBALL="openssl-${OPENSSL_VERSION}.tar.gz"

WORKDIR /src

RUN wget "https://master.dl.sourceforge.net/project/pcre/pcre/${PCRE_VERSION}/${PCRE_TARBALL}"
RUN wget "https://github.com/madler/zlib/releases/download/v${ZLIB_VERSION}/${ZLIB_TARBALL}"
RUN wget "http://nginx.org/download/${NGINX_TARBALL}"
RUN wget "https://github.com/openssl/openssl/releases/download/openssl-${OPENSSL_VERSION}/${OPENSSL_TARBALL}"
RUN file "${PCRE_TARBALL}"
RUN file "${ZLIB_TARBALL}"
RUN file "${NGINX_TARBALL}"
RUN file "${OPENSSL_TARBALL}"
RUN tar xvzf "${PCRE_TARBALL}"
RUN tar xvzf "${ZLIB_TARBALL}"
RUN tar xvzf "${NGINX_TARBALL}"
RUN tar xvzf "${OPENSSL_TARBALL}"

RUN ln -s /src/nginx-${NGINX_VERSION} /src/nginx

WORKDIR /src/nginx

RUN ./configure \
    --with-cpu-opt=generic \
    --with-pcre=/src/pcre-${PCRE_VERSION} \
		--with-zlib=/src/zlib-${ZLIB_VERSION} \
		--with-openssl=/src/openssl-${OPENSSL_VERSION} \
		--conf-path=/etc/nginx/nginx.conf \
		--sbin-path=/sbin/nginx \
		--error-log-path=/dev/stderr \
		--pid-path=/dev/shm/nginx.pid \
		--lock-path=/dev/shm/nginx.lock \
		--http-log-path=/dev/stdout \
		--http-proxy-temp-path=/var/lib/nginx/proxy \
		--http-client-body-temp-path=/var/lib/nginx/body \
		--user=nginx \
		--with-http_ssl_module \
    --with-ld-opt="-static" \
    --with-http_stub_status_module \
    --with-http_gzip_static_module \
    --with-file-aio \
    --with-pcre \
		--with-openssl-opt="no-ssl3 no-weak-ssl-ciphers" \
    --with-cc-opt="-Wno-error -O2 -static -static-libgcc" \
    --without-http_charset_module \
    --without-http_ssi_module \
    --without-http_userid_module \
    --without-http_access_module \
    --without-http_autoindex_module \
    --without-http_geo_module \
    --without-http_auth_basic_module \
    --without-http_map_module \
    --without-http_split_clients_module \
    --without-http_referer_module \
    --without-http_fastcgi_module \
    --without-http_uwsgi_module \
    --without-http_scgi_module \
    --without-http_memcached_module \
    --without-http_empty_gif_module \
    --without-http_browser_module \
    --without-http_upstream_ip_hash_module \
    --without-http_upstream_least_conn_module \
    --without-http_upstream_keepalive_module \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module

RUN sed -i "/CFLAGS/s/ \-O //g" objs/Makefile

RUN make -j $(nproc)

FROM alpine:3.12 AS upx
RUN apk add --no-cache upx binutils
COPY --from=builder /src/nginx/objs/nginx /bin/nginx
RUN strip -s /bin/nginx
RUN upx --best --lzma /bin/nginx

FROM dim9/static:sh AS final
COPY --from=upx /bin/nginx /bin/nginx
# COPY --from=dim9/static:curl /bin/curl /bin/curl
COPY nginx.conf /etc/nginx/nginx.conf
RUN echo 'nginx:x:1000:' > /etc/group && \
    echo 'nginx:x:1000:1000:nginx,,,:/var/nginx:/bin/sh' > /etc/passwd && \
    mkdir -p /var/www/html && \
    echo '<html><body><h1>hello from nginx</h1></body></html>' > /var/www/html/index.html && \
    mkdir -p /var/lib/nginx/proxy && \
    mkdir -p /var/lib/nginx/body && \
    chown -R nginx:nginx /var /etc/nginx

USER nginx

CMD ["/bin/nginx"]


