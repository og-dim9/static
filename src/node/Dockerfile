FROM alpine:3.12 AS node

WORKDIR /src

RUN apk add git gcc g++ linux-headers make python3

RUN git clone --depth=1 https://github.com/nodejs/node -b v18.20.4
WORKDIR /src/node
RUN ./configure --fully-static --enable-static
RUN make -j$(nproc)

FROM scratch AS final

COPY --from=node  /src/node/out/Release/node /bin/node

CMD ["/bin/node"]

LABEL maintainer=dim9
