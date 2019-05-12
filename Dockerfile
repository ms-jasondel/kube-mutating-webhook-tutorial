FROM golang:latest AS build
COPY . /go/src/webhook/
WORKDIR /go/src/webhook/
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get github.com/derekparker/delve/cmd/dlv
RUN dep ensure 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o kube-mutating-webhook-tutorial .

ENTRYPOINT ["dlv debug /go/src/webhook/kube-mutating-webhook-tutorial -l 0.0.0.0:2345 --headless=true --log=true -- server"]

#FROM alpine:latest
#COPY --from=build /go/src/webhook/kube-mutating-webhook-tutorial /kube-mutating-webhook-tutorial
# Install debugger.

#ENTRYPOINT ["./kube-mutating-webhook-tutorial"]