ARG PROJECT

FROM ubuntu:20.04 as xodr_builder

ARG PROJECT
ARG REQUIREMENTS_FILE="requirements.${PROJECT}.ubuntu20.04.system"


RUN mkdir -p /tmp/${PROJECT}
COPY files/${REQUIREMENTS_FILE} /tmp/${PROJECT}

WORKDIR /tmp/${PROJECT}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive xargs apt-get install --no-install-recommends -y < ${REQUIREMENTS_FILE} && \
    rm -rf /var/lib/apt/lists/*


COPY . .

RUN mkdir -p /tmp/${PROJECT}/build

WORKDIR /tmp/${PROJECT}/build
RUN cmake .. && \
    cmake --build . --config Release --target install -- -j $(nproc) && \
    DESTDIR=install make install && \
    cpack -G DEB && find . -type f -name "*.deb" | xargs mv -t .

FROM alpine:3.14

ARG PROJECT

COPY --from=xodr_builder /tmp/${PROJECT}/build /tmp/${PROJECT}/build

