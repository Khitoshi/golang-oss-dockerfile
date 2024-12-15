FROM golang:latest

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    tree \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone /* oss git url */

RUN go mod tidy 

CMD ["bash"]