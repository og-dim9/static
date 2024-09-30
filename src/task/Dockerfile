FROM alpine:3.14 AS task

RUN apk add --no-cache upx binutils

ARG TASK_ARCH=linux_amd64
ARG TASK_URL=https://github.com/go-task/task/releases/download
ARG TASK_VERSION=3.38.0

RUN adduser --disabled-password --gecos '' dimutls

WORKDIR /install/task
RUN wget --no-check-certificate \
    "${TASK_URL}/v${TASK_VERSION}/task_${TASK_ARCH}.tar.gz" && \
    tar -xzf task_${TASK_ARCH}.tar.gz  task -C /bin && \
    rm -rfv task_${TASK_ARCH}.tar.gz
RUN strip -s /bin/task
RUN upx --best --lzma /bin/task

FROM dim9/static:sh AS final
COPY --from=task /bin/task /bin/task

CMD ["/bin/task"]

LABEL maintainer=dim9
