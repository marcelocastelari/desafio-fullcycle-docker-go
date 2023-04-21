FROM golang:1.18 AS build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /fullcycle

FROM scratch

WORKDIR /

COPY --from=build /fullcycle /fullcycle

EXPOSE 8080

ENTRYPOINT [ "/fullcycle" ]