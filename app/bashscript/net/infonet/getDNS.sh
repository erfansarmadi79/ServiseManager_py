#!/bin/sh

#set -x 


interface=$1

if [[ ! "$(ip link show ${interface} 2> /dev/null)" ]]; then
  echo "Interface do not: ${interface}"
  exit 2
fi

# Get the DNS configuration for the specified interface from /etc/conf.d/net
dns=$(grep "dns_servers_${interface}" /etc/conf.d/net | cut -d'=' -f2)

# Check if the DNS configuration is not null
if [[ -z "${dns}" ]]; then
  echo "DNS is not configured."
  exit 3
fi

# Print the DNS configuration for the specified interface
echo "DNS for ${interface}: ${dns}"

#FILE=/etc/resolv.conf
#if [ -f "$FILE" ]; then
#
#    grep "^nameserver" /etc/resolv.conf | awk '{print $2}'
#
#else
#    exit 2
#fi

#INTERFACE=$1
#
#DNS_SERVERS=$(nmcli dev show $INTERFACE | grep 'IP4.DNS' | awk '{print $2}')
#
#echo "$DNS_SERVERS"