FROM golang as build

WORKDIR /go/src/app
ADD ./main.go /go/src/app

RUN go mod init
RUN go get -d -v ./...
RUN go build -o /go/bin/app

# Copy to distroless image
FROM gcr.io/distroless/base-debian10
ENV name="dwi"
COPY --from=build /go/bin/app /
CMD ["/app"]