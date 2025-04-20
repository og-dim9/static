FROM alpine:latest AS base


RUN apk add --no-cache build-base git cmake upx bash


RUN git clone https://github.com/krallin/tini.git /src 

WORKDIR /src
ARG VERSION
RUN git switch  -c v${VERSION}
# patch from https://github.com/VHSgunzo/tini-static/tree/main
#           https://github.com/krallin/tini/pull/224/commits

COPY tini.patch ./tini.patch
RUN git apply tini.patch

ENV CFLAGS="-DPR_SET_CHILD_SUBREAPER=36 -DPR_GET_CHILD_SUBREAPER=37"
ENV LDFLAGS="-static"
ENV MINIMAL=
RUN cmake .
RUN make 
RUN upx --best --lzma /src/tini-static -o /bin/tini-upx
RUN ls -lh /src/tini

FROM scratch AS final
COPY --from=base /bin/tini-upx /bin/tini

LABEL maintainer=dim9
