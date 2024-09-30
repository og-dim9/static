FROM alpine:latest AS base


RUN apk add --no-cache build-base linux-headers upx

WORKDIR /src

ARG BUSYBOX_VERSION
RUN wget https://busybox.net/downloads/busybox-${BUSYBOX_VERSION}.tar.bz2

RUN tar -xvf busybox-${BUSYBOX_VERSION}.tar.bz2

WORKDIR /src/busybox-${BUSYBOX_VERSION}

# COPY --chown=root:root  busybox.config .config
RUN make defconfig
RUN sed -i 's/.*CONFIG_FEATURE_SH_STANDALONE.*/CONFIG_FEATURE_SH_STANDALONE=y/' .config
RUN sed -i 's/.*CONFIG_INSTALL_NO_USR.*/CONFIG_INSTALL_NO_USR=y/' .config
RUN sed -i 's/.*CONFIG_FEATURE_SH_EXTRA_QUIET.*/CONFIG_FEATURE_SH_EXTRA_QUIET=y/' .config
ENV LDFLAGS="-static"
ARG CFLAGS="-Os"
RUN make busybox -j $(nproc)
RUN upx --best --lzma /src/busybox-${BUSYBOX_VERSION}/busybox -o /src/busybox

FROM scratch AS final
COPY --from=base /src/busybox /bin/busybox

SHELL ["/bin/busybox", "hush", "-c"]
CMD ["/bin/busybox", "hush"]
ENV PS1="\w (\h)\n$ "
RUN /bin/busybox mkdir -pv /bin /sbin \
    && /bin/busybox --install -s \
    && rm -rf /sbin

LABEL maintainer=dim9
