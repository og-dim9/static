FROM debian:stable-slim AS base

RUN apt-get update && apt-get install -y busybox-static

FROM scratch AS final

COPY --from=base /bin/busybox /bin/busybox

RUN ["/bin/busybox", "--install", "/bin"]

CMD ["/bin/ash"]

LABEL maintainer=dim9
