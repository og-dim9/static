FROM alpine AS builder

RUN apk add curl

ARG TOFU_VERSION=1.8.1

RUN curl -LO https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_amd64.zip

RUN unzip tofu_${TOFU_VERSION}_linux_amd64.zip

RUN mv tofu /bin/tofu

FROM scratch AS final

COPY --from=builder /bin/tofu /bin/tofu

CMD ["/bin/tofu"]

LABEL maintainer=dim9
