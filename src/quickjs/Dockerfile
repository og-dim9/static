FROM alpine:3.12 AS js

WORKDIR /src

RUN apk add git gcc g++ cmake make

RUN git clone https://github.com/napi-bindings/quickjs-build.git js

WORKDIR /src/js/build
WORKDIR /src/js
ENV CFLAGS="-static"
RUN cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -G "Unix Makefiles" \
        -S ./ \
        -B ./build

RUN cmake --build ./build

FROM scratch AS final

COPY --from=js /src/js/build/quickjs /bin/quickjs

CMD ["/bin/quickjs"]