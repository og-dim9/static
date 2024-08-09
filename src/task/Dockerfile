FROM alpine:3.14 AS task

ARG TASK_ARCH=linux_amd64
ARG TASK_URL=https://github.com/go-task/task/releases/download
ARG TASK_VERSION=v3.38.0

RUN adduser --disabled-password --gecos '' dimutls

WORKDIR /install/task
RUN wget --no-check-certificate \
    "${TASK_URL}/${TASK_VERSION}/task_${TASK_ARCH}.tar.gz" && \
    tar -xzf task_${TASK_ARCH}.tar.gz  task -C /bin && \
    rm -rfv task_${TASK_ARCH}.tar.gz

FROM scratch
COPY --from=task /bin/task /bin/task