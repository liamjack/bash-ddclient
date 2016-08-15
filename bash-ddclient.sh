#!/bin/bash

provider="ovh"
cacheFile="/tmp/bash-ddclient.cache"

source "$provider-config.sh"

# Get cached IP address

if test -e $cacheFile; then
	cacheIp=`cat $cacheFile`
	echo "[INFO] Cached IP address: $cacheIp"
else
	cacheIp="none"
	echo "[INFO] No cached IP address"
fi

# Get current IP address

currentIp=`wget -qO - https://api.ipify.org`

if test $? -ne 0; then
	echo "[ERROR] Failed to fetch IP address."
	exit 1
fi

echo "[INFO] Current IP address: $currentIp"

if test "$cacheIp" != "$currentIp"; then
	echo "[INFO] IP address has changed, updating"

	url="https://$username:$password@$server/nic/update?system=dyndns&hostname=$hostname&myip=$currentIp"
	wget -qO /dev/null -u "bash-ddclient/v1.0"  $url

	if test $? -ne 0; then
		echo "[ERROR] Failed to update IP address."
		exit 2
	fi

	echo "[SUCCESS] IP address updated. Exiting."

	echo $currentIp > $cacheFile
else
	echo "[INFO] IP address has not changed. Exiting."
fi

exit 0
