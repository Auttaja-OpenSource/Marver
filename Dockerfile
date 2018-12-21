FROM instrumentisto/glide:0.13 as builder
WORKDIR /go/src/github.com/Auttaja-OpenSource/Marver
COPY main.go glide.yaml ./
RUN apk add git \
    && glide up -v
RUN go build -o marver .

FROM alpine:3.8
RUN apk add ca-certificates
COPY --from=builder /go/src/github.com/Auttaja-OpenSource/Marver/marver .
ENTRYPOINT ["./marver"]
