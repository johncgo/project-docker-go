FROM golang:alpine AS build
COPY . /app
WORKDIR /app
RUN go build -o app project.go

FROM scratch
COPY --from=build /app/app /
CMD ["/app"]