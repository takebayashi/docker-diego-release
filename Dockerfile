FROM golang:latest
MAINTAINER Shun Takebayashi <shun@takebayashi.asia>

RUN git clone http://github.com/zimbatm/direnv && \
    cd direnv && \
    make install && \
    cd .. && \
    rm -rf direnv

RUN mkdir -p workspace && \
    cd workspace && \
    git clone https://github.com/cloudfoundry-incubator/diego-release.git && \
    cd diego-release && \
    direnv allow && \
    direnv export bash && \
    git checkout develop && \
    ./scripts/update

CMD bash
