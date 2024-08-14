FROM quay.io/ogunalp/kafka-native:latest-kafka-3.7.1 as base

FROM quay.io/quarkus/quarkus-micro-image:2.0 as runner
COPY --from=base --chown=1001:root /work/kafka /bin/kafka

ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092
EXPOSE 9092
EXPOSE 9093

#https://quarkus.io/guides/building-native-image

CMD ["/bin/kafka"]