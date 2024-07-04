FROM golang:1.22.4 AS builder

ARG VERSION=dev
WORKDIR /app


# {{ENV}}
ENV AUTH_SECRET {AUTH_SECRET}
ENV AUTH_EXPIRES_IN {AUTH_EXPIRES_IN}
ENV MAIL_HOST {MAIL_HOST}
ENV MAIL_PORT {MAIL_PORT}
ENV MAIL_USER {MAIL_USER}
ENV MAIL_PASS {MAIL_PASS}
# {{END ENV}}

RUN go install github.com/swaggo/swag/cmd/swag@latest
COPY . .
ENV PATH=$PATH:/go/bin
RUN make build
CMD ["./strive_backend"]