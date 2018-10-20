[source](https://qnap-dev.github.io/container-station-api/qnet.html#docker-compose)

```yaml
version: '2'
services:
  qnet_dhcp:
    image: alpine
    command: ifconfig eth0
    networks:
      - qnet-dhcp

  qnet_static:
    image: alpine
    command: ifconfig eth0
    networks:
      qnet-static:
        ipv4_address: 192.168.80.119

networks:
  qnet-dhcp:
    driver: qnet
    ipam:
      driver: qnet
      options:
        iface: "eth0"

  qnet-static:
    driver: qnet
    ipam:
      driver: qnet
      options:
        iface: "eth0"
      config:
        - subnet: 192.168.80.0/23
          gateway: 192.168.80.254
```