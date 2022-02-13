FROM arm32v7/alpine:latest

RUN apk add --no-cache curl bind-tools

RUN curl --silent -L https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.1/dnscrypt-proxy-linux_arm-2.1.1.tar.gz > /tmp/dnscrypt-proxy.tar.gz && \
    mkdir /opt/dnscrypt-proxy && \
    cd /opt/dnscrypt-proxy && \
    tar xvzf /tmp/dnscrypt-proxy.tar.gz --strip-components 1 && \
    rm /tmp/dnscrypt-proxy.tar.gz

ADD dnscrypt-proxy.toml /opt/dnscrypt-proxy/dnscrypt-proxy.toml

ENTRYPOINT ["/opt/dnscrypt-proxy/dnscrypt-proxy", "-config", "/opt/dnscrypt-proxy/dnscrypt-proxy.toml"]

HEALTHCHECK --interval=300s CMD dig . @localhost > /dev/null || exit 1
