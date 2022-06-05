# Ethereum Validator install scripts

| :exclamation: USE AT OWN RISK                                      |
|:-------------------------------------------------------------------|
| This software is provided "as is" without any warranty of any kind |


### Contents

This repository contains scripts that automate the following steps:

 - Create separate unprivileged user accounts for Geth and Lighthouse
 - Install Geth and a systemd service that starts Geth automatically on boot
 - Install Lighthouse and a systemd service that starts Lighthouse automatically on boot
 - Set up your firewall to allow connectivity for Geth and Lighthouse


### Usage

The installer consists of multiple stages that each perform one task. All stages are idempotent, so running the installer multiple times will have no effect, unless you choose different options.

| :notice: most installers expect to run with root privileges |
|-------------------------------------------------------------|

Run `sudo <stage>/install.sh` to run the installer for a single stage.

Run `sudo install.sh` in the root directory to run all stages.
