FROM golang:alpine AS builder

RUN apk add --no-cache git gcc build-base linux-headers

WORKDIR /src

RUN git clone https://github.com/mikefarah/yq yq

WORKDIR /src/yq

ENV CGO_ENABLED=1
ARG GO_LDFLAGS="-linkmode external -s -w -extldflags '--static-pie'"

RUN go build -buildmode=pie -trimpath -ldflags  "${GO_LDFLAGS}" -o /bin/yq .

FROM scratch AS final

COPY --from=builder /bin/yq /bin/yq

CMD ["/bin/yq"]

LABEL maintainer=dim9
