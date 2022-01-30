FROM golang:1.16-buster AS BUILD
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN GOOS=linux GOARCH=arm64 go build  -o /app/main

FROM  gcr.io/distroless/base-debian10
WORKDIR /app
COPY --from=BUILD /app/main .
USER nonroot:nonroot
ENTRYPOINT ["/app/main"]