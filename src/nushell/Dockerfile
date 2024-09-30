FROM alpine as builder
RUN apk add curl binutils upx

ARG NU_VERSION=0.96.1

RUN curl -LO https://github.com/nushell/nushell/releases/download/${NU_VERSION}/nu-${NU_VERSION}-x86_64-unknown-linux-musl.tar.gz && \
 tar -xvf nu* && \
 cd nu*-musl && \
 mv nu* /bin
RUN chmod +x /bin/nu
RUN strip -s /bin/nu
RUN upx --best --lzma /bin/nu

FROM dim9/static:sh AS final
COPY --from=builder /bin/nu /bin/nu

CMD ["/bin/nu","-n"]

LABEL maintainer=dim9