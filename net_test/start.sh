#!/bin/bash

set -e

WORKDIR=$(pwd)
echo $(whoami)
if [[ "$(whoami || echo '')" == "root" ]]; then
	service ssh restart
	sleep 1
else
	echo "Docker not ran as root. Can't start sshd."
fi

# Create the user
USER=test
useradd -ms /bin/bash ${USER}
echo "${USER}:test" | chpasswd
usermod -aG sudo ${USER}
echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

exec /usr/sbin/gosu ${USER} "$@"
