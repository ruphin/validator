#!/bin/bash
set -e

wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list

apt update
apt install -y grafana

systemctl start grafana-server
systemctl enable grafana-server