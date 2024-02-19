FROM golang:latest

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build

RUN adduser --system --uid 99 fileflows

USER 99:100

CMD [ "sh", "-c", "./chaturbate-dvr -gui-username ${GUI_USERNAME} -gui-password ${GUI_PASSWORD}" ]
