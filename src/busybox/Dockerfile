FROM alpine:latest AS base

ARG BUSYBOX_VERSION=1.36.1

RUN apk add --no-cache build-base linux-headers

WORKDIR /src

RUN wget https://busybox.net/downloads/busybox-${BUSYBOX_VERSION}.tar.bz2

RUN tar -xvf busybox-${BUSYBOX_VERSION}.tar.bz2

WORKDIR /src/busybox-${BUSYBOX_VERSION}

COPY busybox.config .config

# RUN make oldconfig
ENV LDFLAGS="-static"

RUN make busybox
RUN cp /src/busybox-${BUSYBOX_VERSION}/busybox /src/busybox

FROM scratch AS final

COPY --from=base /src/busybox /bin/busybox

RUN ["/bin/busybox", "--install", "/bin"]

CMD ["/bin/busybox", "bash"]

LABEL maintainer=dim9
