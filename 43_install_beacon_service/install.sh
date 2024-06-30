#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/beacon.service" "${DIR}/beacon.service.tmp"

printf "\nChoose network\n"
PS3="> "
select network in "mainnet" "pyrmont" "medalla"; do
  break
done

sed -i "s/\[network\]/${network}/" "${DIR}/beacon.service.tmp"

DEFAULT_CHECKPOINT_SYNC_URL="https://sync-mainnet.beaconcha.in"
printf "\nEnter endpoint for checkpoint sync [https://sync-mainnet.beaconcha.in]\n> "
read checkpoint
checkpoint=${checkpoint:-$DEFAULT_CHECKPOINT_SYNC_URL}

sed -i 's|\[checkpoint\]|'"${checkpoint}"'|' "${DIR}/beacon.service.tmp"

mv "$DIR/beacon.service.tmp" /etc/systemd/system/beacon.service

systemctl daemon-reload
systemctl stop beacon
systemctl start beacon
systemctl enable beacon
