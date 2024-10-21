#jq static build
FROM alpine:latest as builder

RUN apk add --no-cache \
    build-base \
    autoconf \
    automake \
    libtool \
    flex \
    bison \
    git \
    oniguruma-dev \
    jq-dev

WORKDIR /src

RUN git clone --recurse-submodules -j4 https://github.com/jqlang/jq jq

WORKDIR /src/jq

RUN autoreconf -i
RUN ./configure \
    --disable-maintainer-mode \
    --enable-all-static \
    --with-oniguruma=builtin

RUN make

FROM dim9/static:sh AS final

COPY --from=builder /src/jq/jq /bin/jq

CMD ["/bin/jq"]

LABEL maintainer=dim9