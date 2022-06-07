#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/node_exporter.service" /etc/systemd/system/node_exporter.service

systemctl daemon-reload
systemctl stop node_exporter
systemctl start node_exporter
systemctl enable node_exporter
