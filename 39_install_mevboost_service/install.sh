#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/mevboost.service" /etc/systemd/system/mevboost.service

systemctl daemon-reload
systemctl stop mevboost
systemctl start mevboost
systemctl enable mevboost
