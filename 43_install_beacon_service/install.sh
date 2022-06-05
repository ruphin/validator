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

printf "\nEnter backup eth1 endpoint (https://mainnet.infura.io/v3/1234567890abcdef1234567890abcdef)\nOr leave blank to use only local\n> "
read eth1

sed -i 's|\[eth1\]|'",${eth1}"'|' "${DIR}/beacon.service.tmp"


printf "\nEnter endpoint for checkpoint sync (https://1234567890abcdef:1234567890abcdef@eth2-beacon-mainnet.infura.io)\nOr leave blank to skip\n> "
read checkpoint

if [[ "${checkpoint}" != "" ]]; then
  sed -i 's|\[checkpoint\]|'"--checkpoint-sync-url ${checkpoint}"'|' "${DIR}/beacon.service.tmp"
else
  sed -i 's|\[checkpoint\]||' "${DIR}/beacon.service.tmp"
fi

mv "$DIR/beacon.service.tmp" /etc/systemd/system/beacon.service

systemctl daemon-reload
systemctl stop beacon
systemctl start beacon
systemctl enable beacon
