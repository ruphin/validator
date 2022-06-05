#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/geth.service" /etc/systemd/system/geth.service

systemctl daemon-reload
systemctl stop geth
systemctl start geth
systemctl enable geth
