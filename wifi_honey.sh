#!/usr/bin/env bash

if [[ -z "$1" ]]
then
	echo "Missing ESSID"
	exit 1
fi

if [ "$1" == "-h" -o "$1" == "-?" ]
then
	echo "Usage: $0 <essid> <channel> <interface>"
	echo
	echo "Default channel is 1"
	echo "Default interface is wlo1mon"
	echo
	echo "Robin Wood <robin@digininja.org>"
	echo "See Security Tube Wifi Mega Primer episode 26 for more information"
	exit 1
fi

ESSID=$1
CHANNEL=$2
INTERFACE=$3

if [[ "$CHANNEL" == "" ]]
then
	CHANNEL=1
fi

if [[ "$INTERFACE" == "" ]]
then
	INTERFACE="wlo1mon"
fi

sed "s/<ESSID>/$ESSID/" wifi_honey_template.rc | sed "s/<CHANNEL>/$CHANNEL/" | sed "s/<INTERFACE>/$INTERFACE/" > screen_wifi_honey.rc
screen -c screen_wifi_honey.rc
