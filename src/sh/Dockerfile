FROM alpine:latest AS base


RUN apk add --no-cache build-base linux-headers upx

WORKDIR /src

ARG VERSION
RUN wget https://busybox.net/downloads/busybox-${VERSION}.tar.bz2

RUN tar -xvf busybox-${VERSION}.tar.bz2

WORKDIR /src/busybox-${VERSION}

COPY --chown=root:root  busybox.config .config
ENV LDFLAGS="-static"
RUN make oldconfig
RUN make busybox -j $(nproc)
RUN upx --best --lzma /src/busybox-${VERSION}/busybox -o /src/busybox
RUN ls -lh /src/busybox
FROM scratch AS final
COPY --from=base /src/busybox /bin/sh
ENV PS1="\w (\h)\n$ "
CMD ["/bin/sh"]

LABEL maintainer=dim9
