ARG KAFKA_VERSION=3.7.1
FROM quay.io/ogunalp/kafka-native:latest-kafka-${KAFKA_VERSION} as base

FROM scratch AS final-1

COPY --from=base /lib64/ /lib64/
## this is a hack to make it executable
COPY --from=base /lib64/ld-linux-x86-64.so.2 /lib64/

FROM dim9/static:sh AS final

ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092
COPY --from=final-1 / /
COPY --from=base /work/kafka /bin/kafka
COPY --from=dim9/static:kcat /bin/kcat /bin/kcat
COPY --from=dim9/static:jq /bin/jq /bin/jq

EXPOSE 9092
EXPOSE 9093

CMD ["/bin/kafka"]