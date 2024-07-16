FROM golang:alpine AS builder

WORKDIR /build

ENV GOPROXY=https://goproxy.cn,direct
COPY . .
RUN go generate ./...
RUN go build


FROM alpine

WORKDIR /
COPY --from=builder /build/mediamtx /
COPY --from=builder /build/mediamtx.yml /

CMD ["./mediamtx"]