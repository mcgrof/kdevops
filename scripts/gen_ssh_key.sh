#!/bin/bash
# SPDX-License-Identifier: GPL-2.0

source ${TOPDIR}/.config
source ${TOPDIR}/scripts/lib.sh

echo "Creating $KDEVOPS_SSH_PRIVKEY"
ssh-keygen -b 2048 -t rsa -f $KDEVOPS_SSH_PRIVKEY -q -N ""
