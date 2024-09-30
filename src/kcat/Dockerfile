ARG VERSION=1.7.0
FROM liftm/kafkacat:${VERSION} AS kafkacat
#FIXME: build this ourselves
FROM alpine:latest AS upx
RUN apk add --no-cache upx
COPY --from=kafkacat /bin/kcat /bin/kcat
RUN upx --best --lzma /bin/kcat
FROM dim9/static:sh AS final
COPY --from=upx /bin/kcat /bin/kcat
CMD ["/bin/kcat"]