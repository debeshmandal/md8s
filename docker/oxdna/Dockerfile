# syntax=docker/dockerfile:1
FROM alpine:latest
WORKDIR /home/
RUN \
  apk add git cmake make libexecinfo-dev gcc g++ && \
  git clone https://github.com/lorenzo-rovigatti/oxDNA && \
  cd oxDNA && \
  mkdir build && \
  cd build && \
  cmake .. -DCUDA=OFF -DMPI=OFF -DPython=OFF
RUN cd /home/oxDNA/build && make
ENTRYPOINT ["/home/oxDNA/build/bin/oxDNA"]
