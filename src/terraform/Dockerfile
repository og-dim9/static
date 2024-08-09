FROM hashicorp/terraform:0.12.29 AS builder

FROM scratch AS final

COPY --from=builder /bin/terraform /bin/terraform

LABEL maintainer=dim9
