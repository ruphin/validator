#!/bin/bash
set -e

timedatectl set-ntp no || true # this fails if timesyncd is already disabled
apt install -y ntp
