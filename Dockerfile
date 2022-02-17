#syntax=docker/dockerfile:1

##### STAGE 0 - build #####

FROM golang:1.15-alpine AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download
COPY ./templates ./

ADD templates ./templates

COPY ./* ./
RUN go build -o /Jenkins_test

##### STAGE 1 - runtime #####

FROM alpine:latest

WORKDIR /root/
COPY --from=build /app/Jenkins_test ./
CMD [ “/Jenkins_test” ]

EXPOSE 8080