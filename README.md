# ARMv7 and AMD64 docker container for dnscrypt-proxy

Your secure and private DNS server on Raspberry Pi or AMD64-based computer.

This container implements [dnscrypt-proxy](https://github.com/jedisct1/dnscrypt-proxy).

## How to run

```
docker run -dt -p 53:53/udp -p 53:53/tcp --name dnscrypt-proxy --restart unless-stopped imple/dnscrypt-proxy:latest
```
