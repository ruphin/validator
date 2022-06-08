#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mv /tmp/prometheus /usr/local/bin/
mv /tmp/promtool /usr/local/bin/

mkdir -p /etc/prometheus
mv /tmp/consoles /etc/prometheus/
mv /tmp/console_libraries /etc/prometheus/

cp "${DIR}/prometheus.yml" /etc/prometheus/

chown -R prometheus:prometheus /etc/prometheus
