FROM quay.io/ogunalp/kafka-native:latest-kafka-3.7.1 as base

# FROM quay.io/quarkus/quarkus-micro-image:2.0 as runner
#COPY --from=base --chown=1001:root /work/kafka /bin/kafka

ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092
EXPOSE 9092
EXPOSE 9093

RUN ldd /work/kafka | sort
#https://quarkus.io/guides/building-native-image
#RUN find / -name 'linux-vdso*' -o -name 'libc.so*' -o -name 'libz.so*' -o -name 'ld-linux-x86-64.so.2' -o -name 'libpthread.so*' -o -name 'libdl.so*' -o -name 'librt.so*'


FROM scratch AS final

COPY --from=base /work/kafka /bin/kafka
COPY --from=base /lib64/ /lib64/
## this is a hack to make it executable
COPY --from=base /lib64/ld-linux-x86-64.so.2 /lib64/
# COPY --from=base /lib64/libz.so.1 /lib64/
# COPY --from=base /lib64/libpthread.so.0 /lib64/
# COPY --from=base /lib64/libdl.so.2 /lib64/
# COPY --from=base /lib64/librt.so.1 /lib64/
# COPY --from=base /lib64/libc.so.6 /lib64/
# COPY --from=base /lib64/linux-vdso.so.1 /lib64/



CMD ["/bin/kafka"]