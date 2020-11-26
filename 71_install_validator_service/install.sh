#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp "${DIR}/validator.service" "${DIR}/validator.service.tmp"

printf "\nChoose network\n"
PS3="> "
select network in "mainnet" "pyrmont" "medalla"; do
  break
done

sed -i "s/\[network\]/${network}/" "${DIR}/validator.service.tmp"

printf "\nEnter a graffiti (leave blank for no graffiti)\n> "
read graffiti

if [[ ${graffiti} == "" ]]; then
  sed -i "s/\[graffiti\]//" "${DIR}/validator.service.tmp"
else
  sed -i "s/\[graffiti\]/--graffiti ${graffiti}/" "${DIR}/validator.service.tmp"
fi

mv "$DIR/validator.service.tmp" /etc/systemd/system/validator.service

systemctl daemon-reload
systemctl stop validator
systemctl start validator
systemctl enable validator
