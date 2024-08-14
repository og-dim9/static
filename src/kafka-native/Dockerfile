FROM quay.io/ogunalp/kafka-native:latest-kafka-3.7.1 as base

FROM scratch AS final
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092

COPY --from=base /work/kafka /bin/kafka
COPY --from=base /lib64/ /lib64/
## this is a hack to make it executable
COPY --from=base /lib64/ld-linux-x86-64.so.2 /lib64/

EXPOSE 9092
EXPOSE 9093

CMD ["/bin/kafka"]