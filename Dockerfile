FROM golang:latest AS build
COPY . /go/src/webhook/
WORKDIR /go/src/webhook/
RUN go get -u github.com/golang/dep/cmd/dep
RUN dep ensure 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o kube-mutating-webhook-tutorial .

FROM alpine:latest

COPY --from=build /go/src/webhook/kube-mutating-webhook-tutorial /kube-mutating-webhook-tutorial
ENTRYPOINT ["./kube-mutating-webhook-tutorial"]