#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mv /tmp/prometheus /usr/local/bin/
mv /tmp/promtool /usr/local/bin/

mkdir -p /etc/prometheus/consoles
mv /tmp/consoles/* /etc/prometheus/consoles/
mkdir -p /etc/prometheus/console_libraries
mv /tmp/console_libraries/* /etc/prometheus/console_libraries/

cp "${DIR}/prometheus.yml" /etc/prometheus/

chown -R prometheus:prometheus /etc/prometheus
