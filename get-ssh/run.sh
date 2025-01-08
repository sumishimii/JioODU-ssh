#!/bin/sh

[ ! -f /tmp/get-ssh/ssh_host_rsa_key ] && ssh-keygen -t rsa -f /tmp/get-ssh/ssh_host_rsa_key -N ''
[ ! -f /tmp/get-ssh/ssh_host_ecdsa_key ] && ssh-keygen -t ecdsa -f /tmp/get-ssh/ssh_host_ecdsa_key -N ''
[ ! -f /tmp/get-ssh/ssh_host_ed25519_key ] && ssh-keygen -t ed25519 -f /tmp/get-ssh/ssh_host_ed25519_key -N ''

/usr/sbin/sshd -f /tmp/get-ssh/sshd_config
