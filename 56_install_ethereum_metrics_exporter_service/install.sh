#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/ethereum_metrics_exporter.service" /etc/systemd/system/ethereum_metrics_exporter.service

systemctl daemon-reload
systemctl stop ethereum_metrics_exporter
systemctl start ethereum_metrics_exporter
systemctl enable ethereum_metrics_exporter
