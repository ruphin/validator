#!/bin/bash
set -e

# Ports for Lighthouse
ufw allow 9000


printf "Allow remote access through ssh?\n"
PS3="> "
select ssh in "yes" "no"; do
  break
done

if [[ "${ssh}" == "yes" ]]; then
  # Port for SSH
  ufw allow 22/tcp
fi

ufw enable