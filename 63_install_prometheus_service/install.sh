#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/prometheus.yml" /etc/prometheus/
chown -R prometheus:prometheus /etc/prometheus

cp "${DIR}/prometheus.service" /etc/systemd/system/prometheus.service

systemctl daemon-reload
systemctl stop prometheus
systemctl start prometheus
systemctl enable prometheus
