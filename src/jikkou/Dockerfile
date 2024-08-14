# FROM maven as builder


# RUN git clone https://github.com/streamthoughts/jikkou /src

# WORKDIR /src

# RUN ./mvnw clean package -Pnative -DskipTests
FROM debian:stable-slim AS builder

RUN apt-get update && apt-get install -y unzip wget file
WORKDIR /src
RUN wget https://github.com/streamthoughts/jikkou/releases/download/v0.35.0/jikkou-0.35.0-linux-x86_64.zip


RUN unzip jikkou-0.35.0-linux-x86_64.zip
RUN mv jikkou-0.35.0-linux-x86_64 jikkou
RUN ldd jikkou/bin/jikkou
# RUN find / -name 'linux-vdso*' -o -name 'libc.so*' -o -name 'libz.so*' -o -name 'ld-linux-x86-64.so.2'

FROM scratch AS final-1


COPY --from=builder /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
COPY --from=builder /usr/lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=builder /usr/lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=builder /usr/lib/x86_64-linux-gnu/libz.so.1.2.13 /lib/x86_64-linux-gnu/libz.so.1.2.13
COPY --from=builder /usr/lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

FROM scratch AS final

COPY --from=final-1 / /
COPY --from=builder /src/jikkou/bin/jikkou /bin/jikkou

CMD ["/bin/jikkou"]
