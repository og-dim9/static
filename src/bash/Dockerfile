FROM alpine as base

RUN apk add bash tar curl gnupg build-base alpine-sdk

COPY build.sh build.sh

RUN bash ./build.sh

WORKDIR /releases

FROM scratch AS final

COPY --from=base /releases/bash /bin/bash

CMD ["/bin/bash"]

LABEL maintainer=dim9
