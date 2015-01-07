FROM golang:latest
MAINTAINER Shun Takebayashi <shun@takebayashi.asia>

RUN mkdir -p /root
WORKDIR /root

RUN git clone http://github.com/zimbatm/direnv && cd direnv && \
    make install && \
    cd .. && rm -rf direnv

ENV GOPATH /root/workspace/diego-release
ENV PATH /root/workspace/diego-release/bin

RUN mkdir -p workspace && cd workspace && \
    git clone https://github.com/cloudfoundry-incubator/diego-release.git && cd diego-release && git checkout develop && \
    ./scripts/update

CMD bash
