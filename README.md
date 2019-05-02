# ARMv7 docker container for dnscrypt-proxy.

Your secure and private DNS server on Raspberry Pi!

This container implements [dnscrypt-proxy](https://github.com/jedisct1/dnscrypt-proxy).
Just run this docker container on your Raspberry Pi.

## How to run

```
docker run -dt -p 53:53/udp -p 53:53/tcp --name dnscrypt-proxy --restart unless-stopped imple/dnscrypt-proxy:latest
```

After the container is running, configure your operating system or router to use address of your RPi as a DNS server.

## Docker on Raspberry Pi

For those who do not know how to get docker on Raspberry Pi, here is very small manual.

```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh ./get-docker.sh
```
