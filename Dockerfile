FROM golang AS build-env

COPY ./gohello /go/src/gohello
WORKDIR /go/src/gohello

RUN go build -v -ldflags="-s -w"

#----------------------------------------

FROM scratch
COPY --from=build-env /go/src/gohello/gohello /gohello

CMD ["/gohello"]
