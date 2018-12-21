FROM instrumentisto/glide:latest
WORKDIR /go/src/github.com/Auttaja-OpenSource/Marver
COPY main.go glide.yaml ./
RUN apk add git \
    && glide up -v
RUN go build -o marver .

FROM alpine
RUN apk add ca-certificates
COPY --from=0 /go/src/github.com/Auttaja-OpenSource/Marver/marver .
ENTRYPOINT ["./marver"]
