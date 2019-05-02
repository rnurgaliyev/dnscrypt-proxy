FROM arm32v7/alpine:latest

RUN apk add --no-cache curl bind-tools

RUN curl --silent -L https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.23/dnscrypt-proxy-linux_arm-2.0.23.tar.gz > /tmp/dnscrypt-proxy-linux_arm-2.0.23.tar.gz && \
    mkdir /opt/dnscrypt-proxy && \
    cd /opt/dnscrypt-proxy && \
    tar xvzf /tmp/dnscrypt-proxy-linux_arm-2.0.23.tar.gz --strip-components 1 && \
    rm /tmp/dnscrypt-proxy-linux_arm-2.0.23.tar.gz

ADD dnscrypt-proxy.toml /opt/dnscrypt-proxy/dnscrypt-proxy.toml

ENTRYPOINT ["/opt/dnscrypt-proxy/dnscrypt-proxy", "-config", "/opt/dnscrypt-proxy/dnscrypt-proxy.toml"]

HEALTHCHECK --interval=10s CMD dig . @localhost || exit 1
