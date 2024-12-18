FROM test.zddata.cloud:8443/library/golang:1.23.4-alpine3.21 AS builder

WORKDIR /build

ENV GOPROXY=https://goproxy.cn,direct
COPY . .
# RUN go generate ./...
RUN echo "v1.10.0" > internal/core/VERSION
# RUN cp internal/servers/hls/hls.min.js internal/servers/hls/hls.min.js
# RUN cp internal/staticsources/rpicamera/mtxrpicam_32 internal/staticsources/rpicamera/mtxrpicam_32
# RUN cp internal/staticsources/rpicamera/mtxrpicam_64 internal/staticsources/rpicamera/mtxrpicam_64
RUN CGO_ENABLED=0 go build .


FROM test.zddata.cloud:8443/library/alpine:3.21

WORKDIR /
COPY --from=builder /build/mediamtx /
# COPY --from=builder /build/mediamtx.yml /

CMD ["./mediamtx"]