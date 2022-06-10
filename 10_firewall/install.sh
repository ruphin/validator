#!/bin/bash
set -e

# Ports for Lighthouse
ufw allow 9000/tcp
ufw allow 9000/udp

# Ports for Geth
ufw allow 30303/tcp
ufw allow 30303/udp

# Open port for Grafana on local network only
sudo ufw allow from 192.168.0.0/24 to any port 3000

printf "Allow remote access through ssh?\n"
PS3="> "
select ssh in "yes" "no"; do
  break
done

if [[ "${ssh}" == "yes" ]]; then
  # Port for SSH
  ufw allow ssh
fi

ufw enable
