FROM alpine:latest AS dl
ARG VERSION

RUN apk add --no-cache curl git

RUN git clone https://github.com/kcctl/kcctl  --depth 1 --branch ${VERSION} /src

FROM ghcr.io/graalvm/native-image-community:22 AS builder

COPY --from=dl /src /src

WORKDIR /src
RUN ./mvnw clean package -DskipTests -Pnative
WORKDIR /src/target
# RUN cat /src/target/kcctl-*-runner > /src/target/kcctl

FROM debian:stable-slim AS libc
FROM scratch  AS runtime

COPY --from=libc /usr/lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=libc /usr/lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=libc /usr/lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

COPY --from=builder /src/target/kcctl-1.0.0-SNAPSHOT-runner /bin/kcctl

ENTRYPOINT ["/bin/kcctl"]
SHELL [ "/bin/sh" ]
CMD ["--help"]