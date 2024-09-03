FROM alpine:latest AS dl

RUN apk add --no-cache curl git

RUN git clone https://github.com/bmTas/cb2xml /src

FROM ghcr.io/graalvm/native-image-community:22 AS builder
COPY --from=dl /src /src

WORKDIR /src
RUN ./mvnw clean package -DskipTests
WORKDIR /src/target
RUN mkdir -pv META-INF

FROM builder  AS xml2dat
WORKDIR /src/target/
RUN jar cfe xml2dat.jar net.sf.cb2xml.Xml2Dat -C classes .
RUN native-image -jar xml2dat.jar -o xml2dat

FROM builder  AS dat2xml
WORKDIR /src/target/
RUN jar cfe dat2xml.jar net.sf.cb2xml.Dat2Xml -C classes .
RUN native-image -jar dat2xml.jar -o dat2xml

FROM builder  AS cb2xml
WORKDIR /src/target
RUN jar cfe cb2xml.jar net.sf.cb2xml.Cb2Xml -C classes .
RUN native-image -jar cb2xml.jar -o cb2xml

#FIXME: do we need all of debian?
FROM debian:stable-slim AS libc
FROM debian:stable-slim  AS runtime

COPY --from=libc /usr/lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=libc /usr/lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=libc /usr/lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

COPY --from=dat2xml /src/target/dat2xml /bin/dat2xml
COPY --from=xml2dat /src/target/xml2dat /bin/xml2dat
COPY --from=cb2xml /src/target/cb2xml /bin/cb2xml

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]