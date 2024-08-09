FROM alpine:3.12 as make

RUN apk add --no-cache gcc musl-dev make file

WORKDIR /src

RUN wget https://ftp.gnu.org/gnu/make/make-4.3.tar.gz

RUN tar -xzf make-4.3.tar.gz

WORKDIR /src/make-4.3

ENV CFLAGS="-static"

RUN ./configure --without-guile

FROM scratch AS final

COPY --from=make /src/make-4.3/make /bin/make

CMD ["/bin/make"]