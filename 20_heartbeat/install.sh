#!/bin/bash

echo "Enter Dead Man's Snitch key (https://nosnch.in/<key>) or leave empty to skip"
printf "> "
read key

if [[ "${key}" != "" ]]; then
  echo "*/15 * * * * root curl https://nosnch.in/$key &> /dev/null" > /etc/cron.d/heartbeat
fi
