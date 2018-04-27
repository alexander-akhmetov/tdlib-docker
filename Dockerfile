FROM alpine:3.7 as builder

RUN apk update && apk add gperf alpine-sdk openssl-dev git cmake

WORKDIR /tmp/_build_tdlib/

RUN git clone https://github.com/tdlib/td.git /tmp/_build_tdlib/
RUN git checkout v1.2.0

RUN mkdir build
WORKDIR /tmp/_build_tdlib/build/
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build .
RUN make install
RUN rm -rf /tmp/_build_tdlib/

FROM alpine:3.7

COPY --from=builder /usr/local/lib/libtd* /usr/local/lib/

RUN apk update && apk add gperf openssl-dev git cmake
