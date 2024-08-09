FROM debian:stable-slim AS base

RUN apt-get update && apt-get install -y bash-static

FROM scratch AS final

COPY --from=base /bin/bash-static /bin/bash

CMD ["/bin/bash"]