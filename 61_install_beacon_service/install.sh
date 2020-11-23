#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/beacon.service" "${DIR}/beacon.service.tmp"

printf "\nChoose network\n"
PS3="> "
select network in "mainnet" "medalla"; do
  break
done

sed -i "s/\[network\]/${network}/" "${DIR}/beacon.service.tmp"

printf "\nEnter eth1 endpoint (https://mainnet.infura.io/v3/1234567890abcdef1234567890abcdef)\n> "
read eth1

sed -i 's|\[eth1\]|'"${eth1}"'|' "${DIR}/beacon.service.tmp"

mv "$DIR/beacon.service.tmp" /etc/systemd/system/beacon.service

systemctl daemon-reload
systemctl start beacon
systemctl enable beacon



# printf "\nEnter a graffiti (leave blank for no graffiti)\n> "
# read graffiti

# if [[ ${graffiti} == "" ]]; then
#   sed -i "s/\[graffiti\]//" "${DIR}/beacon.service.tmp"
# else
#   sed -i "s/\[graffiti\]/--graffiti ${graffiti}/" "${DIR}/beacon.service.tmp"
# fi