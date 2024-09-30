FROM alpine:3.12 as make
ARG VERSION=4.3
RUN apk add --no-cache gcc musl-dev make file upx

WORKDIR /src

RUN wget https://ftp.gnu.org/gnu/make/make-${VERSION}.tar.gz

RUN tar -xzf make-${VERSION}.tar.gz

WORKDIR /src/make-${VERSION}

ENV CFLAGS="-static -Os"

RUN ./configure --without-guile

RUN make -j $(nproc)

RUN upx --best --ultra-brute make -o /src/make

FROM dim9/static:sh AS final

COPY --from=make /src/make /bin/make

CMD ["/bin/make"]

LABEL maintainer=dim9
