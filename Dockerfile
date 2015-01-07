FROM golang:latest
MAINTAINER Shun Takebayashi <shun@takebayashi.asia>

RUN mkdir -p /root
WORKDIR /root

ENV GOPATH /root/workspace/diego-release
ENV PATH /root/workspace/diego-release/bin:$PATH

RUN mkdir -p workspace && cd workspace && \
    git clone https://github.com/cloudfoundry-incubator/diego-release.git && cd diego-release && git checkout develop && \
    ./scripts/update

CMD bash
