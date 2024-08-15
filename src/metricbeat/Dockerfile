FROM debian:stable-slim AS base

ARG METRICBEAT_VERSION='7.0.0'

RUN apt-get update && apt-get install -y wget gnupg file

WORKDIR /src

RUN wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-${METRICBEAT_VERSION}-linux-x86_64.tar.gz

RUN tar -xvf metricbeat-${METRICBEAT_VERSION}-linux-x86_64.tar.gz

WORKDIR /src/metricbeat-${METRICBEAT_VERSION}-linux-x86_64

RUN cp metricbeat /bin/metricbeat

RUN file /bin/metricbeat
# RUN ldd /bin/metricbeat && exit 1 || true

FROM scratch AS final-1

#linux-vdso.so.1
COPY  --from=base /lib/x86_64-linux-gnu/libpthread.so.0  /lib/
COPY  --from=base /lib/x86_64-linux-gnu/libdl.so.2 /lib/
COPY  --from=base /lib/x86_64-linux-gnu/libc.so.6 /lib/
COPY  --from=base /lib64/ld-linux-x86-64.so.2 /lib64/

FROM scratch AS final

COPY --from=final-1 / /
COPY --from=base /bin/metricbeat /bin/metricbeat

RUN ["/bin/metricbeat","version"]

CMD ["/bin/metricbeat"]